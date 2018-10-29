require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Media do
  let(:media) { FactoryBot.create(:bootstrap_media) }

  subject { described_class }

  it { is_expected.to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#component_family' do
    subject { media.component_family }
    it { is_expected.to eq :media }
  end
end
