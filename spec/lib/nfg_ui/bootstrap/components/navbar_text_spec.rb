require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::NavbarText do
  let(:navbar_text) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#component_family' do
    subject { navbar_text.component_family }
    it { is_expected.to eq :navbar }
  end
end
