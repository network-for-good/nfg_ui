require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::MediaObject do
  let(:media_object) { FactoryBot.create(:bootstrap_media_object) }

  subject { described_class }

  it { is_expected.to be < NfgUi::Bootstrap::Components::Base }

  describe '#component_css_class' do
    subject { media_object.send(:component_css_class) }
    it { is_expected.to eq 'media' }
  end
end
