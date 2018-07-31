require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Base do
  let(:bootstrap_base) { NfgUi::Bootstrap::Components::Base.new(component_options, view_context) }
  let(:component_options) { default_options.merge!(tested_options_hash) }

  let(:id) { nil }
  let(:tested_id) { 'tested_id' }
  let(:data) { {} }
  let(:tested_data) { { data_key: :data_value } }
  let(:body) { nil }
  let(:tested_body) { 'tested body' }
  let(:default_options) { { class: nil,
                            id: id,
                            data: data,
                            body: body } }
  let(:tested_options_hash) { {} }
  let(:view_context) { tested_view_context }
  let(:tested_view_context) { ActionController::Base.new.view_context }

  describe 'Base component initialization' do
    subject { bootstrap_base }
    let(:id) { tested_id }
    let(:data) { tested_data }
    let(:body) { tested_body }
    let(:tested_options_hash) { { tested_key: :tested_value } }

    it 'initializes with the expected attributes' do
      expect(subject.options).to eq component_options
      expect(subject.options).to include tested_options_hash
      expect(subject.view_context).to eq tested_view_context
      expect(subject.id).to eq tested_id
      expect(subject.data).to eq tested_data
      expect(subject.body).to eq tested_body
    end
  end

  describe '#html_options' do
    subject { bootstrap_base.html_options }

    describe 'options except non_html_attribute_options' do
      let(:non_html_attribute_options_array) { bootstrap_base.send(:non_html_attribute_options) }

      context 'when non_html_attribute_options are present in the options hash' do
        let(:tested_options_hash) { { body: 'overwriting tested body', heading: 'tested heading', traits: [:a_trait] } }
        it 'does not include non_html_attribute_options in the html_options hash' do
          expect(subject).not_to include tested_options_hash
        end
      end

      context 'when the options hash does not contain attributes in the non_html_attribute_options array' do
        let(:tested_options_hash) { { test_attribute: :test_value } }
        it 'includes the tested options hash within the html_options' do
          expect(subject).to include tested_options_hash
        end
      end
    end

    describe 'options merged in to html_options' do
      let(:id) { tested_id }
      let(:data) { tested_data }
      let(:body) { tested_body }
      let(:standard_options) { { class: 'base', id: tested_id, data: tested_data } }

      context 'when assistive_html_attributes are present' do
        let(:assistive_html_attributes_hash) { { role: 'test-attribute' } }
        before { allow(bootstrap_base).to receive(:assistive_html_attributes).and_return(assistive_html_attributes_hash) }
        it { is_expected.to eq(**standard_options, **assistive_html_attributes_hash )  }
      end

      context 'when assitive_html_attributes are not present' do
        it { is_expected.to eq standard_options }
      end
    end

    describe 'options with blank keys' do
      let(:id) { nil }
      let(:data) { nil }

      it 'rejects options with blank keys' do
        expect(subject.keys).not_to include :data
        expect(subject.keys).not_to include :id
      end
    end
  end

  describe '#component_family' do
    subject { bootstrap_base.send(:component_family) }
    it { is_expected.to be_nil }
  end

  describe '#defaults' do
    subject { bootstrap_base.send(:defaults) }
    it { is_expected.to eq(class: '', id: nil, body: nil, data: nil) }

    describe 'defaults for data attribute' do
      context 'when data is present' do
        let(:data) { tested_data }
        it { expect(subject[:data]).to eq({}) }
      end

      context 'when data is not present' do
        let(:data) { nil }
        it { expect(subject[:data]).to be_nil }
      end
    end
  end

  describe '#assistive_html_attributes' do
    subject { bootstrap_base.send(:assistive_html_attributes) }
    it { is_expected.to eq({}) }
  end

  describe '#component_css_class' do
    subject { bootstrap_base.send(:component_css_class) }
    it { is_expected.to eq 'base' }
  end

  describe '#component_class_name_string' do
    subject { bootstrap_base.send(:component_class_name_string) }
    it { is_expected.to eq 'Base' }
  end

  describe '#css_classes' do
    subject { bootstrap_base.send(:css_classes) }
    let(:tested_options_hash) { { class: css_class } }
    context 'when component options include css classes' do
      let(:css_class) { 'test_class' }
      it { is_expected.to eq "base #{css_class}" }
    end

    context 'when component options do not include css classes' do
      let(:css_class) { nil }
      it { is_expected.to eq 'base' }
    end
  end

  describe '#non_html_attribute_options' do
    subject { bootstrap_base.send(:non_html_attribute_options) }
    it { is_expected.to eq %i[body heading traits] }
  end
end
