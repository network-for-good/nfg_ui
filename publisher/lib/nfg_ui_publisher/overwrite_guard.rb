# frozen_string_literal: true

require 'open3'

module NfgUiPublisher
  # Responsible for preventing us from unintentionally overwriting previously published assets
  class OverwriteGuard
    # We want command line arguments passed in from 'rake' to exactly match this string
    # in order to opt-out of the guard's protection
    SET_OVERRIDE_FLAG = 'override'

    # @param console [#puts] the destination for console advisory messages; typically would be STDOUT
    # @param override_flag [String] must be explicitly set to the value of SET_OVERRIDE_FLAG in order to opt-out of checking
    def initialize(console:, override_flag:)
      @console = console
      @guard_active = (override_flag != SET_OVERRIDE_FLAG)
    end

    # Uses AWS CLI to determine whether published assets already exist at the destination URI
    # @param uri [String] identifies the proposed destination of the assets to be published
    # @yield err_msg [String]
    #   if files are discovered, or if we receive an unexpected error from AWS, we yield
    #   descriptive text back to the caller
    # @return [void]
    def check(uri)
      unless guard_active
        console.puts "The asset publishing override flag was specified, so we are skipping checks for pre-existing files in '#{uri}'"
        return
      end

      cmd_output, status = Open3.capture2e("aws s3 ls #{uri}")

      if status.success?
        # Success means the AWS CLI found existing objects stored at the destination URI,
        # which is an error condition for us
        yield format(ERR_MSG, uri: uri)
        return
      end

      return if status.exitstatus == NO_FILES_FOUND_EXIT_CODE

      yield "Received unexpected error code '#{status.exitstatus}' while checking for pre-existing files in '#{uri}':\n\n#{cmd_output}"
    end

    private

    attr_reader :console, :guard_active

    private_constant

    ERR_MSG = <<~ERR_MSG
      \n**** Pre-existing files were detected in '%<uri>s'.
      **** To overwrite the files, please invoke this task with the override argument:
      ****   rake publish[#.##.#,#{SET_OVERRIDE_FLAG}]\n
    ERR_MSG

    NO_FILES_FOUND_EXIT_CODE = 1
  end
end
