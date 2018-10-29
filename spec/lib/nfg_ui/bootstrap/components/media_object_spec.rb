require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::MediaObject do
  let(:media_object) { FactoryBot.create(:bootstrap_media_object) }

  subject { described_class }

  it { is_expected.to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#component_css_class' do
    subject { media_object.component_css_class }
    it { is_expected.to eq String.new }
  end

  describe '#component_family' do
    subject { media_object.component_family }
    it { is_expected.to eq :media }
  end
end
