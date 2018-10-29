require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::ListGroup do
  let(:list_group) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Wrappable utility module'

  describe '#component_family' do
    subject { list_group.component_family }
    it { is_expected.to eq :list_group }
  end

  describe '#flush' do
    subject { list_group.flush }
    context 'when flush is true' do
      let(:options) { { flush: true } }
      it { is_expected.to be }
    end

    context 'when flush is false' do
      let(:options) { { flush: false } }
      it { is_expected.not_to be }
    end

    context 'whenf flush is not set' do
      let(:options) { {} }
      it { is_expected.not_to be }
    end
  end

  describe '#css_classes' do
    subject { list_group.send(:css_classes) }
    context 'when flush is true' do
      let(:options) { { flush: true } }
      it { is_expected.to include 'list-group-flush' }
    end

    context 'when flush is false' do
      let(:options) { { flush: false } }
      it { is_expected.not_to include 'list-group-flush' }
    end

    context 'whenf flush is not set' do
      let(:options) { {} }
      it { is_expected.not_to include 'list-group-flush' }
    end
  end

  describe '#default_html_wrapper_element' do
    subject { list_group.send(:default_html_wrapper_element) }
    it { is_expected.to eq :ul }
  end

  describe '#non_html_attribute_options' do
    subject { list_group.send(:non_html_attribute_options) }
    it { is_expected.to include :flush }
  end
end
