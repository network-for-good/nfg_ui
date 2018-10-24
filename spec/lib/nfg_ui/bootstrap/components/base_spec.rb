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

  it_behaves_like 'a component with a consistent initalized construction'

  describe '#component_family' do
    subject { bootstrap_base.component_family }
    it { is_expected.to be_nil }
  end

  describe '#data' do
    subject { bootstrap_base.data }

    context 'when data is present' do
      let(:tested_options_hash) { { data: tested_data } }
      it { is_expected.to eq tested_data }
    end

    context 'when data is not present' do
      let(:tested_options_hash) { {} }
      it { is_expected.to eq({}) }
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
          expect(subject).to eq(class: bootstrap_base.send(:component_css_class))
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
      let(:tested_options_hash) { { id: nil, data: nil } }

      it 'rejects options with blank keys' do
        expect(subject.keys).not_to include :data
        expect(subject.keys).not_to include :id
      end
    end
  end

  describe '#href' do
    subject { bootstrap_base.href }
    context 'when :href is present in options' do
      let(:tested_href) { 'tested_href' }
      let(:component_options) { { href: tested_href } }
      it { is_expected.to eq tested_href }
    end

    context 'when :href is not present in options' do
      let(:component_options) { {} }
      it { is_expected.to be_nil }
    end

    context 'when :href is nil in options' do
      let(:component_options) { { href: nil } }
      it { is_expected.to be_nil }
    end
  end  

  describe '#id' do
    subject { bootstrap_base.id }
    context 'when :id is present in options' do
      let(:tested_id) { 'tested_id' }
      let(:component_options) { { id: tested_id } }
      it { is_expected.to eq tested_id }
    end

    context 'when :id is not present in options' do
      let(:component_options) { {} }
      it { is_expected.to be_nil }
    end

    context 'when :id is nil in options' do
      let(:component_options) { { id: nil } }
      it { is_expected.to be_nil }
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

  describe '#defaults' do
    subject { bootstrap_base.send(:defaults) }
    it { is_expected.to eq(class: '', id: nil, body: nil, data: {}) }
  end

  describe '#non_html_attribute_options' do
    subject { bootstrap_base.send(:non_html_attribute_options) }
    it { is_expected.to eq %i[body heading traits] }
  end
end
