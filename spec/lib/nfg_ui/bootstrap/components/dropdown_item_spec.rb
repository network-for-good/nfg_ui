require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::DropdownItem do
  let(:dropdown_item) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Wrappable utility module', component_suite: :bootstrap
  it_behaves_like 'a component that includes the Activatable utility module', component_suite: :bootstrap
  it_behaves_like 'a component that includes the Disableable utility module', component_suite: :bootstrap
  it_behaves_like 'a component that includes the Tooltipable utility module'
  it_behaves_like 'a component that includes the Remotable utility module', component_suite: :bootstrap, skip_include_check: true

  describe '#component_family' do
    subject { dropdown_item.component_family }
    it { is_expected.to eq :dropdown }
  end

  describe 'private methods' do
    subject { dropdown_item.send(tested_method) }

    describe '#default_html_wrapper_element' do
      let(:tested_method) { :default_html_wrapper_element }
      it { is_expected.to eq :a }
    end
  end
end
