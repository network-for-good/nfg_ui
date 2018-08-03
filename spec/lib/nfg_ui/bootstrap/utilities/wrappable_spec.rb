require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Utilities::Wrappable do
  # Badge is wrappable
  let(:badge) { FactoryBot.create(:bootstrap_badge, **options) }
  let(:options) { {} }

  describe '#as' do
    subject { badge.as }

    context 'when :as is provided in the options' do
      let(:options) { { as: :strong } }
      it { is_expected.to eq :strong }
    end

    context 'when :as is not provided in the options' do
      let(:options) { {} }
      context 'when :href within options is not present' do
        it { is_expected.to eq :span }
      end

      context 'when href is included within the options' do
        let(:options) { { href: 'test_href' } }
        it { is_expected.to eq :a }
      end

      context 'when a :type with value :submit is present in the options' do
        let(:options) { { type: 'submit' } }
        it { is_expected.to eq :button }
      end
    end
  end

  describe '#href' do
    subject { badge.send(:href) }
    let(:options) { { href: tested_href } }

    context 'when :href is present within the options' do
      let(:tested_href) { 'test_href' }
      it { is_expected.to eq tested_href }
    end

    context 'when :href is nil within the options' do
      let(:tested_href) { nil }
      it { is_expected.to be_nil }
    end

    context 'when :href is not present within the options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#default_html_wrapper_element' do
    let(:test_class) { Class.new { include NfgUi::Bootstrap::Utilities::Wrappable }.new }
    subject { test_class.send(:default_html_wrapper_element) }

    context 'when default_html_wrapper_element is not overwritten' do
      it { is_expected.to eq :span }
    end

    context 'when default_html_wrapper_element has been overwritten' do
      before { test_class.instance_variable_set(:@default_html_wrapper_element, :a) }

      it 'accepts the redefined value as set by the component' do
        expect(subject).to eq :a
      end
    end
  end

  describe '#non_html_attribute_options' do
    subject { badge.send(:non_html_attribute_options) }
    it { is_expected.to include :as }
  end
end
