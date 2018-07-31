require 'rails_helper'

RSpec.describe NfgUi::UI::NetworkForGood do
  let(:view_context) { ActionController::Base.new.view_context }
  let(:nfg_ui_component) { NfgUi::UI::NetworkForGood.new(view_context, component_name, *traits, **options, &block) }
  let(:component_name) { :alert }
  let(:traits) { [:trait] }
  let(:options) { { body: body } }
  let(:body) { nil }
  let(:block) { nil }

  describe '#initialize' do
    subject { nfg_ui_component }
    it 'initializes the nfg_ui_component component with the expected attributes' do
      expect(nfg_ui_component.view_context).to eq view_context
      expect(nfg_ui_component.component_name).to eq component_name
      expect(nfg_ui_component.traits).to eq traits
      expect(nfg_ui_component.options).to eq options.merge!(traits: traits)
      expect(nfg_ui_component.options[:body]).not_to be
    end
  end

  describe '#component_name_folder' do
    subject { nfg_ui_component.send(:component_name_folder) }

    context 'when the component has a component family' do
      let(:component_name) { :breadcrumb_item } # breadcrumb_item belongs to breadcrumb component family
      it { is_expected.to eq 'breadcrumbs' }
    end

    context 'when the component does not have a component family' do
      let(:component_name) { :alert } # alert does not belong to a component family
      it { is_expected.to eq 'alerts' }
    end
  end

  describe '#group' do
    subject { nfg_ui_component.send(:group) }
    context 'when the component is a foundation' do
      let(:component_name) { :icon }
      it { is_expected.to eq 'Foundations' }
    end

    context 'when the component is an element' do
      let(:component_name) { :activity }
      it { is_expected.to eq 'Elements' }
    end

    context 'when the component is a pattern' do
      let(:component_name) { :tile }
      it { is_expected.to eq 'Patterns' }
    end
  end

  describe '#ancestry_string' do
    let(:component_name) { :alert }
    subject { nfg_ui_component.send(:ancestry_string) }
    it { is_expected.to eq "NfgUi::Components::Elements::Alert" }
  end

  describe '#components_within_group(grouping:)' do
    subject { nfg_ui_component.send(:components_within_group, grouping: grouping) }

    context 'when the component is a foundation' do
      let(:grouping) { 'foundation' }
      it { is_expected.to eq NfgUi::FOUNDATION_COMPONENT_NAMES }
    end

    context 'when the component is a element' do
      let(:grouping) { 'element' }
      it { is_expected.to eq NfgUi::ELEMENT_COMPONENT_NAMES }
    end

    context 'when the component is a pattern' do
      let(:grouping) { 'pattern' }
      it { is_expected.to eq NfgUi::PATTERN_COMPONENT_NAMES }
    end
  end
end
