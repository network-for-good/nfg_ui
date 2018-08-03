require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Utilities::Themeable do
  # Button is both disableable and tooltipable.
  let(:button) { FactoryBot.create(:bootstrap_button, **options) }
  let(:options) { { tooltip: tested_tooltip } }
  let(:tested_tooltip) { nil }

  describe '#tooltip' do
    subject { button.tooltip }
    context 'when :tooltip is present in the options' do
      let(:tested_tooltip) { 'tested tooltip' }
      it { is_expected.to eq tested_tooltip }
    end

    context 'when tooltip is nil in the options' do
      let(:tested_tooltip) { nil }
      it { is_expected.to be_nil }
    end

    context 'when tooltip is not present in the options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#html_options' do
    subject { button.html_options }
    let(:options) { { tooltip: tested_tooltip, disabled: tested_disabled, style: tested_style, **add_on_options } }
    let(:add_on_options) { {} }
    let(:tested_disabled) { nil }
    let(:tested_style) { nil }
    context 'when :tooltip is present in the options' do
      let(:tested_tooltip) { 'tested tooltip' }
      it { is_expected.to include(title: tested_tooltip) }

      context 'when component is disabled' do
        let(:tested_disabled) { true }
        it { is_expected.to eq(class: 'btn btn-primary disabled', tabindex: nil, title: nil, style: 'pointer-events: none;', data: {}) }

        context 'when a component has :style applied in the options' do
          let(:tested_style) { 'background-color: purple;' }
          it { is_expected.to include(style: "#{tested_style} pointer-events: none;") }
        end

        context 'when a component does not have :style applied in the options' do
          it { is_expected.to include(style: 'pointer-events: none;') }
        end
      end

      context 'when component is not disabled' do
        let(:tested_disabled) { false }
        it { is_expected.not_to include(style: 'pointer-events: none;') }
        it { is_expected.to eq(class: 'btn btn-primary', title: tested_tooltip, style: nil, data: { toggle: 'tooltip', placement: :top, html: 'true' }, tabindex: nil) }
      end

      context 'when :modal is present in the options as well' do
        let(:add_on_options) { { modal: tested_modal } }
        let(:tested_modal) { 'tested_modal' }
        it 'prioritizes modal options and ignores tooltip options' do
          expect(subject).not_to include(data: button.send(:tooltip_data_attributes))
          expect(subject).to include(data: { toggle: 'modal', target: "##{tested_modal}" })
        end
      end
    end
  end

  describe '#tooltip_data_attributes' do
    subject { button.send(:tooltip_data_attributes) }
    it { is_expected.to eq(toggle: 'tooltip', placement: :top, html: 'true') }
  end

  describe '#non_html_attribute_options' do
    subject { button.send(:non_html_attribute_options) }
    it { is_expected.to include :tooltip }
  end

  describe '#tooltip_placement' do
    subject { button.send(:tooltip_placement) }
    context 'when tooltip placement is not redefined' do
      it { is_expected.to eq :top }
    end

    context 'when tooltip placement has been redefined' do
      before { button.instance_variable_set(:@tooltip_placement, :bottom) }
      it { is_expected.to eq :bottom }
    end
  end

  describe '#disabled_component_tooltip_wrapper_html_options' do
    subject { button.disabled_component_tooltip_wrapper_html_options }
    let(:tested_tooltip) { 'Tested title' }
    it { is_expected.to eq(data: { toggle: 'tooltip', placement: :top, html: 'true' }, title: tested_tooltip, class: 'd-inline-block', tabindex: '0') }
  end
end
