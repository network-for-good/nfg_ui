# frozen_string_literal: true

require_relative '../../../lib/nfg_ui_publisher/overwrite_guard'

RSpec.describe NfgUiPublisher::OverwriteGuard do
  let(:console) { instance_double(IO, puts: nil) }
  let(:override_flag) { ''}
  let(:uri) { 's3://nfg-ui-publisher-test/v0.0.0' }
  let(:cmd_output) { 'EXAMPLE' }

  # this can be confusing: when AWS S3 CLI command is successful,
  # that means files were found, which is an error condition for this code.
  # So the happy path for this code is when the command fails, exit code 1,
  # meaning no files were found at the S3 destination URI
  let(:cmd_success_flag) { false }
  let(:cmd_exit_status) { 1 }

  let(:cmd_status) do
    instance_double(Process::Status, success?: cmd_success_flag, exitstatus: cmd_exit_status)
  end

  subject do
    described_class.new(console: console, override_flag: override_flag)
  end

  before do
    allow(Open3).to receive(:capture2e).with(/#{uri}/).and_return([cmd_output, cmd_status])
  end

  context 'when pre-existing files are not found at the destination URI' do
    it '#check does not yield an error message' do
      expect { |b| subject.check(uri, &b) }.not_to yield_control
    end
  end

  context 'when files exist at the destination URI' do
    let(:cmd_success_flag) { true } # meaning the AWS CLI app detected files at the S3 destination URI

    it '#check yields an error message' do
      expect { |b| subject.check(uri, &b) }.to yield_with_args(an_instance_of(String))
    end

    context 'and the override flag is set' do
      let(:override_flag) { 'override' }

      it '#check does not yield an error message' do
        expect { |b| subject.check(uri, &b) }.not_to yield_control
      end

      it '#check writes an advisory message to the console' do
        subject.check(uri)
        expect(console).to have_received(:puts)
      end
    end
  end

  context 'when the AWS CLI returns an unexpected error condition' do
    let(:cmd_exit_status) { 254 }

    it '#check yields an error message' do
      expect { |b| subject.check(uri, &b) }.to yield_with_args(an_instance_of(String))
    end
  end
end
