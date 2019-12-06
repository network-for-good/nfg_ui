require 'rails_helper'

RSpec.describe NfgUi::Components::Utilities::ResourceThemeable do
  # Page header is resource themeable
  let(:page_header) { NfgUi::Components::Patterns::PageHeader.new(options, view_context) }
  let(:view_context) { ApplicationController.new.view_context }
  let(:options) { {} }

  describe '#resource_theme_color(object = nil)' do
    let(:object) { nil }
    subject { page_header.resource_theme_color(object) }
    # It returns only primary, regardless of the condition for now.
    it { is_expected.to eq 'primary' }
  end

  describe '#resource_theme_name(object = nil)' do
    let(:object) { nil }
    subject { page_header.resource_theme_name(object) }

    context 'when an object is present' do

      context 'and when object is a string' do
        let(:object) { 'a_string' }
        it { is_expected.to eq 'a_string' }
      end

      context 'and when object is a class' do
        let(:object) { page_header }
        it { is_expected.to eq 'NfgUi::Components::Patterns::PageHeader' }
      end

      context 'and when object is neither class nor string' do
        let(:object) { ['1', '2'] }
        it { is_expected.to eq 'Array' }
      end

      context 'and when object is a symbol' do
        let(:object) { :test_case }
        it 'classifys the symbol as a string' do
          expect(subject).to eq 'TestCase'
        end
      end
    end

    context 'when an object is not present' do
      let(:object) { nil }
      context 'when controller_name is defined' do
        let(:test_controller_name) { 'test_controller' }
        pending 'Unclear how to test this -- unable to stub `controller_name`'
      end

      context 'when controller_name is not defined' do
        context 'and when view_context is defined' do
          it { is_expected.to eq 'Application' }
        end

        context 'and when view_context is not defined' do
          pending 'Unclear how to test this -- unable to remove view_context from the component'
        end
      end
    end
  end
end
