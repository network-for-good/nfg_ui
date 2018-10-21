require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::NavItem do
  let(:nav) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Wrappable utility module'

  describe '#component_family' do
    subject { nav.component_family }
    it { is_expected.to eq :nav }
  end

  describe '#default_html_wrapper_element' do
    subject { nav.send(:default_html_wrapper_element) }
    it { is_expected.to eq :li }
  end
end
