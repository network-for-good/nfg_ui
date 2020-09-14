# frozen_string_literal: true

require 'open3'
require_relative 'overwrite_guard'

module NfgUiPublisher
  # Wraps S3 COPY calls sent via the AWS CLI, including a safeguard against accidental overwrite
  # @see NfgUiPublisher::OverwriteGuard
  class Uploader
    # @param console [#puts] the destination for console advisory messages; defaults to STDOUT
    # @param override_flag [String] must be explicitly set to the value of NfgUiPublisher::SET_OVERRIDE_FLAG in order to opt-out of checking
    def initialize(console: STDOUT, **override_params)
      @console = console
      @guard = NfgUiPublisher::OverwriteGuard.new(console: console, **override_params)
    end

    # Upload files from a directory to an S3 URI
    # @param src_dir [String] location of the parent directory of assets to upload
    # @param uri [String] identifies the storage location in S3
    # @yieldparam err_msg [String] if guard check fails, or if an upload error occurs
    # @return [void]
    def call(src_dir, uri)
      guard.check(uri) do |err_msg|
        yield err_msg
      end

      console.puts("Preparing to publish compiled assets in '#{src_dir}' to '#{uri}'")

      command = "aws s3 cp --recursive --acl public-read #{src_dir} #{uri}"
      cmd_output_str, status = Open3.capture2e(command)

      if status.success?
        console.puts("Assets were successfully uploaded to '#{uri}':\n\n")
        console.puts(cmd_output_str) # so user can see the results of the files that were uploaded
        console.puts
        return
      end

      yield "AWS CLI returned exit status code (#{status.exitstatus}) while attempting upload.\n\n#{cmd_output_str}"
    end

    private

    attr_reader :console, :guard
  end
end
