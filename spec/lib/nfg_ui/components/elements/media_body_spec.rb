require 'rails_helper'

RSpec.describe NfgUi::Components::Elements::MediaBody do
  let(:media_body) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::MediaBody }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#component_family' do
    subject { media_body.component_family }
    it { is_expected.to eq :media }

    it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Traitable }
  end
end
