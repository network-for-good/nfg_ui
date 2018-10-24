require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Dropdown do
  let(:dropdown) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the DropdownDirectionable utility module'

  describe '#button' do
    subject { dropdown.button }
    let(:tested_button_text) { 'Tested Button Text' }

    context 'when button text is supplied in options' do
      let(:options) { { button: tested_button_text } }
      it { is_expected.to eq tested_button_text }
    end

    context 'when button text is not supplied in options' do
      it { is_expected.to eq '' }
    end
  end

  describe '#component_family' do
    subject { dropdown.component_family }
    it { is_expected.to eq :dropdown }
  end

  describe '#offset' do
    subject { dropdown.offset }
    let(:tested_offset) { '10,20' }

    context 'when offset is supplied in options' do
      let(:options) { { offset: tested_offset } }
      it { is_expected.to eq tested_offset }
    end

    context 'when button text is not supplied in options' do
      it { is_expected.to eq '' }
    end
  end

  describe '#theme' do
    subject { dropdown.theme }

    let(:tested_theme) { :warning }
    context 'when theme is present in options' do
      let(:options) { { theme: tested_theme } }
      it { is_expected.to eq tested_theme }
    end

    context 'when theme is not present in options' do
      let(:options) { {} }
      it { is_expected.to eq NfgUi::DEFAULT_BOOTSTRAP_THEME }
    end
  end

  describe 'private methods' do
    subject { dropdown.send(tested_method) }
    describe '#non_html_attribute_options' do
      let(:tested_method) { :non_html_attribute_options }
      it { is_expected.to include :theme, :button, :offset, :dropleft, :dropright, :dropup }
    end
  end
end
