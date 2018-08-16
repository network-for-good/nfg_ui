require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Button do
  let(:button) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Themeable utility module'
  it_behaves_like 'a component that includes the Wrappable utility module'
  it_behaves_like 'a component that includes the Activatable utility module'
  it_behaves_like 'a component that includes the Sizable utility module'
  it_behaves_like 'a component that includes the Disableable utility module'
  it_behaves_like 'a component that includes the Tooltipable utility module'
  it_behaves_like 'a component that includes the Collapsible utility module'

  describe '#block' do
    subject { button.block }
    let(:options) { { block: tested_block } }
    let(:tested_block) { nil }

    context 'when :block is set as true in options' do
      let(:tested_block) { true }
      it { is_expected.to be }
    end

    context 'when :block is set as false in options' do
      let(:tested_block) { false }
      it { is_expected.to be false }
    end

    context 'when :block is set as nil in options' do
      let(:tested_block) { nil }
      it { is_expected.to be_nil }
    end

    context 'when :block is not present in options' do
      let(:options) { {} }
      it { is_expected.to be false }
    end
  end

  describe '#modal' do
    let(:options) { { modal: tested_modal } }
    let(:tested_modal) { nil }
    subject { button.modal }

    context 'when :modal is present & provided in the options' do
      let(:tested_modal) { '#tested_modal' }
      it { is_expected.to eq tested_modal }
    end

    context 'when :modal is nil in the options' do
      let(:tested_modal) { nil }
      it { is_expected.to be_nil }
    end

    context 'when :modal is not present in the options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#collapse_data_attributes' do
    subject { button.collapse_data_attributes }
    pending 'coming soon'
  end

  describe '#html_options' do
    context 'button for a modal' do
      let(:options) { { modal: tested_modal } }
      let(:tested_modal) { nil }
      subject { button.html_options }

      context 'when modal is truthy' do
        let(:tested_modal) { '#tested_modal' }
        it { is_expected.to include(data: { toggle: 'modal', target: "#{tested_modal}" }) }
      end

      context 'when modal is falsey' do
        let(:options) { {} }
        it { is_expected.not_to include(data: { toggle: 'modal' }) }
      end
    end

    context 'button for a collapse' do
      pending 'coming soon'
      context 'and when the button is as a :button' do
      end

      context 'and when the button is as an :a' do
      end
    end
  end

  describe '#component_css_class' do
    subject { button.send(:component_css_class) }
    it { is_expected.to eq 'btn' }
  end

  describe '#css_classes' do
    let(:options) { { block: tested_block } }
    subject { button.send(:css_classes) }
    
    context 'when :block is true in options' do
      let(:tested_block) { true }
      it { is_expected.to include 'btn-block' }
    end

    context 'when :block is false in options' do
      let(:tested_block) { false }
      it { is_expected.not_to include 'btn-block' }
    end

    context 'when :block is nil in options' do
      let(:tested_block) { nil }
      it { is_expected.not_to include 'btn-block' }
    end

    context 'when :block is not present in options' do
      let(:options) { {} }
      it { is_expected.not_to include 'btn-block' }
    end
  end

  describe '#default_html_wrapper_element' do
    subject { button.send(:default_html_wrapper_element) }
    it { is_expected.to eq :a }
  end

  describe '#non_html_attribute_options' do
    subject { button.send(:non_html_attribute_options) }
    it { is_expected.to include(:modal, :block) }
  end

  describe '#assistive_html_attributes' do
    let(:options) { { active: tested_active } }
    let(:tested_active) { nil }
    subject { button.send(:assistive_html_attributes) }

    context 'when :active is true' do
      let(:tested_active) { true }
      it { is_expected.to include(aria: { pressed: true }) }
    end

    context 'when :active is false' do
      let(:tested_active) { false }
      it { is_expected.not_to include(aria: { pressed: true }) }
    end

    context 'when :active is not present' do
      let(:options) { {} }
      it { is_expected.not_to include(aria: { pressed: true }) }
    end
  end
end
