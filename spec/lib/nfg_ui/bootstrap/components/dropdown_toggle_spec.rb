require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::DropdownToggle do
  let(:dropdown_toggle) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Wrappable utility module'


  describe '#offset' do
    subject { dropdown_toggle.offset }
    let(:tested_offset) { '10,20' }

    context 'when offset is supplied in options' do
      let(:options) { { offset: tested_offset } }
      it { is_expected.to eq tested_offset }
    end

    context 'when button text is not supplied in options' do
      it { is_expected.to eq '' }
    end
  end

  describe '#data' do
    subject { dropdown_toggle.data }
    context 'when offset is present' do
      let(:options) { { offset: '10,20' } }
      it { is_expected.to eq(toggle: 'dropdown', offset: '10,20') }
    end

    context 'when offset is not present' do
      it { is_expected.to eq(toggle: 'dropdown') }
    end

    context 'when there are other data attributes in the component' do
      let(:tested_data) { { tested: 'value' } }
      let(:options) { { data: tested_data, offset: '10,20' } }
      it { is_expected.to eq(offset: '10,20', **tested_data, toggle: 'dropdown') }
    end
  end

  describe '#theme' do
    subject { dropdown_toggle.theme }

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

  describe '#nav_link' do
    subject { dropdown_toggle.nav_link }
    context 'when nav_link is present in options' do
      let(:options) { { nav_link: true } }
      it { is_expected.to be }
    end

    context 'when nav_link is not present in options' do
      let(:options) { {} }
      it { is_expected.not_to be }
    end
  end

  describe '#href' do
    subject { dropdown_toggle.href }
    context 'when :as is :a' do
      let(:options) { { as: :a } }
      it { is_expected.to eq '#' }
    end

    context 'when :as is not :a' do
      it { is_expected.to be_nil }
    end
  end

  describe '#component_family' do
    subject { dropdown_toggle.component_family }
    it { is_expected.to eq :dropdown }
  end

  describe 'private methods' do
    subject { dropdown_toggle.send(tested_method) }

    describe '#default_html_wrapper_element' do
      let(:tested_method) { :default_html_wrapper_element }
      it { is_expected.to eq :button }
    end

    describe '#assistive_html_attributes' do
      let(:tested_method) { :assistive_html_attributes }
      it { is_expected.to eq({ aria: { haspopup: "true", expanded: "false" } }) }
    end

    describe '#non_html_attribute_options' do
      let(:tested_method) { :non_html_attribute_options }
      it { is_expected.to include :offset, :nav_link }
    end
  end
end
