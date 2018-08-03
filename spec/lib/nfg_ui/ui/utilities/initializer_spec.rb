require 'rails_helper'

RSpec.describe NfgUi::UI::Utilities::Initializer do
  let(:test_class_with_initializer) { Class.new { include NfgUi::UI::Utilities::Initializer } }
  let(:view_context) { ActionController::Base.new.view_context }
  let(:tested_component_name) { :alert }
  let(:traits) { [] }
  let(:options) { { body: body } }
  let(:body) { 'test body' }
  let(:block) { nil }
  let(:component_suite) { 'Bootstrap' }
  let(:component) {
                    "NfgUi::UI::#{component_suite}".constantize.new(
                      view_context,
                      tested_component_name,
                      *traits,
                      **options,
                      &block
                    )
                  }
  describe '#render_component' do
    let(:component_css_class) { component.component.send(:component_css_class) }
    subject { component.render_component }

    context 'rendering #bootstrap components' do
      let(:component_suite) { 'Bootstrap' }
      it { is_expected.to eq "<div class='alert alert-primary' role='alert'>\n<button class=\"btn close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden='true'>\n&times;\n</span>\n\n</button>#{body}\n</div>\n" }
    end

    context 'rendering #nfg components' do
      let(:component_suite) { 'NetworkForGood' }
      pending 'once NFG components have been re-enstated'
    end
  end

  describe '#initializer' do
    context 'initializing Bootstrap components' do
      let(:component_suite) { 'Bootstrap' }
      let(:traits) { %i[trait1 trait2] }
      let(:options) { { option1: 'option1-value', option2: 'option2-value' } }
      subject { component.send(:initializer, tested_component_name, *traits, **options, &block) }

      describe 'it stores the correct information on the base component' do
        it { expect(component.component_name).to eq tested_component_name }
        it { expect(component.class_name).to eq 'Alert' }
        it { expect(component.traits).to eq traits }
        it { expect(component.options).to eq options.merge!(traits: traits) }
      end
    end

    context 'initializing Network for Good components' do
      pending 'Coming after Network for Good components are re-enstated'
    end
  end

  describe '#ancestry_string' do
    subject { test_class_with_initializer.new.send(:ancestry_string) }
    it { is_expected.to eq '' }
  end

  describe '#component_family' do
    pending 'This describe block & #component_family
             should be revisited once component_family functionality
             has been better organized'
  end

  describe '#group' do
    subject { test_class_with_initializer.new.send(:group) }
    it { is_expected.not_to be }
  end

  describe '#components_within_group' do
    subject { test_class_with_initializer.new.send(:components_within_group) }
    it { is_expected.to eq [] }
  end

  describe '#partial_path' do
    subject { component.send(:partial_path) }
    context 'partial path for bootstrap components' do
      let(:component_suite) { 'Bootstrap' }
      it { is_expected.to eq 'nfg_ui/bootstrap/alert' }
    end

    context 'partial path for network for good components' do
      let(:component_suite) { 'NetworkForGood' }
      before { allow(component).to receive(:component_family).and_return(nil) }
      it { is_expected.to eq 'nfg_ui/elements/alerts/alert' }
    end
  end
end
