# frozen_string_literal: true

require_relative '../../../lib/nfg_ui_publisher/uploader'

RSpec.describe NfgUiPublisher::Uploader do
  let(:console) { instance_double(IO, puts: nil) }
  let(:override_flag) { '' }

  let(:src_dir) { '/tmp/example/precompiled_assets/' }
  let(:uri) { 's3://nfg-ui-publisher-test/v0.0.0' }
  let(:cmd_output) do
    <<~OUTPUT
      upload: public/assets/nfg_ui/tooltips-939bbb341fd2cc639ad8eff0f7f2c306e6f33edc7e6b1b2cf7ad79c106895ef8.js.gz to s3://nfg-ui/v0.11.1.1/nfg_ui/tooltips-939bbb341fd2cc639ad8eff0f7f2c306e6f33edc7e6b1b2cf7ad79c106895ef8.js.gz
      upload: public/assets/nfg_ui/vendor/legacy_browser_support/application-11b02ba2e91525d9c16619f86e5c483fbad318e4d8f90d1fd038c84ebd5bbd8c.js.gz to s3://nfg-ui/v0.11.1.1/nfg_ui/vendor/legacy_browser_support/application-11b02ba2e91525d9c16619f86e5c483fbad318e4d8f90d1fd038c84ebd5bbd8c.js.gz
      upload: public/assets/nfg_ui/network_for_good/core/application-d994baac0c3175874dc55ddb80d4218ec110b46b9f24923bd91240df863824c2.css.gz to s3://nfg-ui/v0.11.1.1/nfg_ui/network_for_good/core/application-d994baac0c3175874dc55ddb80d4218ec110b46b9f24923bd91240df863824c2.css.gz
      upload: public/assets/nfg_ui/network_for_good/core/application-d994baac0c3175874dc55ddb80d4218ec110b46b9f24923bd91240df863824c2.css to s3://nfg-ui/v0.11.1.1/nfg_ui/network_for_good/core/application-d994baac0c3175874dc55ddb80d4218ec110b46b9f24923bd91240df863824c2.css
    OUTPUT
  end

  let(:cmd_success_flag) { true }
  let(:cmd_exit_status) { 0 }

  let(:cmd_status) do
    instance_double(Process::Status, success?: cmd_success_flag, exitstatus: cmd_exit_status)
  end

  let(:guard) { instance_double(NfgUiPublisher::OverwriteGuard, check: nil) }

  subject do
    described_class.new(console: console, override_flag: override_flag)
  end

  before do
    allow(NfgUiPublisher::OverwriteGuard)
      .to receive(:new)
      .with(console: console, override_flag: override_flag)
      .and_return(guard)

    allow(Open3).to receive(:capture2e).with(/#{uri}/).and_return([cmd_output, cmd_status])
  end

  it '#call invokes the OverwriteGuard correctly' do
    subject.call(src_dir, uri)
    expect(guard).to have_received(:check).with(uri)
  end

  it '#call writes CDN output' do
    subject.call(src_dir, uri)
    expect(console).to have_received(:puts).with(/cloudfront/)
  end

  it '#call does not yield an error message' do
    expect { |b| subject.call(src_dir, uri, &b) }.not_to yield_control
  end

  context 'when the OverwriteGuard instance yields an error' do
    before do
      allow(guard).to receive(:check).and_yield('files found!')
    end

    it '#call yields an error message' do
      expect { |b| subject.call(src_dir, uri, &b) }.to yield_with_args('files found!')
    end
  end

  context 'when the S3 COPY operation is unsuccessful' do
    let(:cmd_success_flag) { false }
    let(:cmd_exit_status) { 127 }
    let(:cmd_output) { 'argh' }

    it '#call yields an error message' do
      expect { |b| subject.call(src_dir, uri, &b) }.to yield_with_args(/argh/)
    end
  end
end
