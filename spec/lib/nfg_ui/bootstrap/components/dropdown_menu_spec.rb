require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::DropdownMenu do
  let(:dropdown_menu) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#component_family' do
    subject { dropdown_menu.component_family }
    it { is_expected.to eq :dropdown }
  end

  describe '#right' do
    subject { dropdown_menu.right }

    context 'when right is true in options' do
      let(:options) { { right: true } }
      it { is_expected.to be }
    end

    context 'when right is not present' do
      it { is_expected.not_to be }
    end
  end

  describe 'private methods' do
    subject { dropdown_menu.send(tested_method) }

    describe '#css_classes' do
      let(:tested_method) { :css_classes }

      context 'when right is true' do
        let(:options) { { right: true } }
        it { is_expected.to eq 'dropdown-menu dropdown-menu-right' }
      end

      context 'when right is not present' do
        it { is_expected.to eq 'dropdown-menu' }
      end
    end

    describe '#non_html_attribute_options' do
      let(:tested_method) { :non_html_attribute_options }
      it { is_expected.to include :right }
    end
  end
end
