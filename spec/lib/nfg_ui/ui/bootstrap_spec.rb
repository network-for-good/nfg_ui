require 'rails_helper'

RSpec.describe NfgUi::UI::Bootstrap do
  let(:view_context) { ActionController::Base.new.view_context }
  let(:bootstrap) { NfgUi::UI::Bootstrap.new(view_context, component_name, *traits, **options, &block) }
  let(:component_name) { :alert }
  let(:traits) { [:trait] }
  let(:options) { { body: body } }
  let(:body) { nil }
  let(:block) { nil }

  describe '#initialize' do
    subject { bootstrap }
    it 'initializes the bootstrap component with the expected attributes' do
      expect(bootstrap.view_context).to eq view_context
      expect(bootstrap.component_name).to eq component_name
      expect(bootstrap.traits).to eq traits
      expect(bootstrap.options).to eq options.merge!(traits: traits)
      expect(bootstrap.options[:body]).not_to be
    end
  end

  describe '#component_name_folder' do
    subject { bootstrap.send(:component_name_folder) }

    context 'when the component has a component family' do
      let(:component_name) { :card } # card belongs to a component family
      it { is_expected.to eq 'cards' }
    end

    context 'when the component does not have a component family' do
      let(:component_name) { :alert } # alert does not belong to a component family
      it { is_expected.not_to be }
    end
  end

  describe '#group' do
    subject { bootstrap.send(:group) }
    it { is_expected.to eq 'bootstrap' }
  end

  describe '#ancestry_string' do
    let(:component_name) { :alert }
    subject { bootstrap.send(:ancestry_string) }
    it { is_expected.to eq "NfgUi::Bootstrap::Components::Alert" }
  end

  describe '#components_within_group(*)' do
    subject { bootstrap.send(:components_within_group) }
    it { is_expected.to eq NfgUi::BOOTSTRAP_COMPONENT_NAMES }
  end
end
