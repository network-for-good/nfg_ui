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
        lines = cmd_output_str.split(/\n/)

        core_match = lines.find do |line|
          match = line.match(%r{to (?<uri>s3://.+?/network_for_good/core/application-\w+?\.css)\Z})
          break match if match
        end

        unless core_match
          puts "Upload succeeded, but we were not able to identify the core stylesheet URL from the following output:\n\n#{cmd_output_str}\n"
          return
        end

        core_stylesheet_uri = core_match[:uri]

        # TODO: hard-coding the CDN URI for now, for convenience, but we will probably want to switch to something more robust
        cloudfront_uri = ENV.fetch('NFG_CLOUDFRONT_URI', 'https://d2pjrg2y3fmcfa.cloudfront.net')

        cdn_url = core_stylesheet_uri.sub(%r{s3://nfg-ui}, cloudfront_uri).to_s

        console.puts "Core CSS File URL:\n#{cdn_url}"
        return
      end

      yield "AWS CLI returned exit status code (#{status.exitstatus}) while attempting upload.\n\n#{cmd_output_str}"
    end

    private

    attr_reader :console, :guard
  end
end
