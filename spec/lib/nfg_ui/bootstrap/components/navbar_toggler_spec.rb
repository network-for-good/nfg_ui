require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::NavbarToggler do
  let(:navbar_toggler) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the CollapseToggleable utility module', component_suite: :bootstrap
  
  describe '#component_family' do
    subject { navbar_toggler.component_family }
    it { is_expected.to eq :navbar }
  end
end
