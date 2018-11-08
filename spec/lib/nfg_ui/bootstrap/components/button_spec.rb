require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Button do
  let(:button) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Activatable utility module'
  it_behaves_like 'a component that includes the CollapseToggleable utility module'
  it_behaves_like 'a component that includes the Disableable utility module'
  it_behaves_like 'a component that includes the Remotable utility module'
  it_behaves_like 'a component that includes the Sizable utility module'
  it_behaves_like 'a component that includes the Themeable utility module', component_suite: :bootstrap
  it_behaves_like 'a component that includes the Tooltipable utility module'
  it_behaves_like 'a component that includes the Wrappable utility module'

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

  describe '#data' do
    subject { button.data }

    describe 'modal implications on the component data attribute' do
      context 'when :modal is present in options' do
        let(:data_hash) { {} }
        let(:modal) { '#test_modal' }
        let(:options) { { data: data_hash, modal: modal } }

        context 'when data is already present' do
          let(:data_hash) { { test: 'value' } }
          it { is_expected.to eq(**data_hash, toggle: 'modal', target: "#{modal}") }
        end

        context 'when data is not already present' do
          it { is_expected.to eq({ toggle: 'modal', target: "#{modal}" }) }
        end
      end

      context 'when :modal is not present in options' do
        let(:options) { {} }
        it { is_expected.to eq({}) }
      end
    end
  end

  describe '#href' do
    subject { button.href }
    context 'when :as is :button' do
      let(:options) { { as: :button } }
      it { is_expected.to be_nil }
    end

    context 'when :as is not button' do
      let(:options) { {} }
      let(:tested_collapse) { '#tested_collapse' }
      let(:tested_modal) { '#tested_modal' }
      
      context 'href with collapse' do
        let(:options) { { collapse: tested_collapse } }
        context 'when collapse is truthy' do
          it { is_expected.to eq tested_collapse }
        end

        context 'when collapse is falsey' do
          let(:options) { { collapse: false } }
          it { is_expected.to eq '#' }
        end
      end
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

  describe '#remove_component_css_classes' do
    subject { button.remove_component_css_classes }
    let(:options) { { remove_component_css_classes: tested_remove_component_css_classes } }
    let(:tested_remove_component_css_classes) { nil }

    context 'when :block is set as true in options' do
      let(:tested_remove_component_css_classes) { true }
      it { is_expected.to be }
    end

    context 'when :block is set as false in options' do
      let(:tested_remove_component_css_classes) { false }
      it { is_expected.to be false }
    end

    context 'when :block is set as nil in options' do
      let(:tested_remove_component_css_classes) { nil }
      it { is_expected.to be_nil }
    end

    context 'when :block is not present in options' do
      let(:options) { {} }
      it { is_expected.to be false }
    end
  end

  describe 'private methods' do
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

    describe '#collapse_data_attributes' do
      subject { button.send(:collapse_data_attributes) }
      let(:options) { { collapse: 'collapse_target', as: as } }

      context 'when collapse is an <a> tag' do
        let(:as) { :a }
        it { is_expected.not_to include :target }
      end

      context 'when collapse is not an <a> tag' do
        let(:as) { :button }
        it { is_expected.to include :target }
      end
    end

    describe '#component_css_class' do
      subject { button.send(:component_css_class) }
      context 'when remove_component_css_classes is true' do
        let(:options) { { remove_component_css_classes: true } }
        it { is_expected.to eq '' }
      end

      context 'when remove_component_css_classes is false' do
        let(:options) { { remove_component_css_classes: false } }
        it { is_expected.to eq 'btn' }
      end
    end

    describe '#default_html_wrapper_element' do
      subject { button.send(:default_html_wrapper_element) }
      it { is_expected.to eq :a }
    end

    describe '#non_html_attribute_options' do
      subject { button.send(:non_html_attribute_options) }
      it { is_expected.to include(:modal, :block, :remote, :remove_component_css_classes) }
    end
  end
end
