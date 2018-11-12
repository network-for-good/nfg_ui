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

  describe '#component_family' do
    subject { dropdown_item.component_family }
    it { is_expected.to eq :dropdown }
  end

  describe 'private methods' do
    subject { dropdown_item.send(tested_method) }

    describe '#css_classes' do
      let(:tested_method) { :css_classes }
      context 'when disabled and tooltipped' do
        let(:options) { { disabled: true, tooltip: 'test tooltip' } }
        it { is_expected.to eq ' ' }
      end

      context 'when not disabled and not tooltipped' do
        it { is_expected.to eq 'dropdown-item' }
      end
    end

    describe '#default_html_wrapper_element' do
      let(:tested_method) { :default_html_wrapper_element }
      it { is_expected.to eq :a }
    end
  end
end
