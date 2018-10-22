require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Collapse do
  let(:collapse) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { { id: test_id } }
  let(:test_id) { 'test_id' }
  
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction', required_options: { id: 'test_id' }
  # it_behaves_like 'a component that includes the Collapsible utility module'

  # describe '#id' do
  #   let(:view_context) { ActionController::Base.new.view_context }
  #   let(:collapse) { NfgUi::Bootstrap::Components::Collapse.new(options, view_context) }
  #   let(:options) { {} }
  #   subject { collapse.id }

  #   context 'when collapse id is present' do
  #     let(:options) { { id: test_id } }
  #     it { expect { subject }.not_to raise_error }
  #     it { is_expected.to eq test_id }
  #   end

  #   context 'when collapse id is not present' do
  #     let(:options) { {} }
  #     it { expect { subject }.to raise_error(ArgumentError) }
  #   end
  # end

  describe '#collapsed' do
    subject { collapse.collapsed }
    
    context 'when :collapsed is present within options' do
      let(:test_collapsed) { false }
      let(:options) { { id: test_id, collapsed: test_collapsed } }
      it { is_expected.to eq test_collapsed }
    end

    context 'when :collapsed is not present within options' do
      let(:options) { { id: test_id } }
      it { is_expected.to be }
    end
  end

  describe '#css_classes' do
    subject { collapse.send(:css_classes) }
    let(:options) { { id: test_id, collapsed: test_collapsed } }
    
    context 'when the component has :collapsed set as true' do
      let(:test_collapsed) { true }
      it { is_expected.not_to include 'show' }
    end

    context 'when the component has :collapsed set to false' do
      let(:test_collapsed) { false }
      it { is_expected.to include 'show' }
    end
  end

  describe '#non_html_attribute_options' do
    subject { collapse.send(:non_html_attribute_options) }
    it { is_expected.to include :collapsed }
  end

  describe '#default_collapsed' do
    subject { collapse.send(:default_collapsed) }
    it { is_expected.to be }
  end
end
