# frozen_string_literal: true

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
      it { is_expected.to eq :span }
    end
  end

  describe 'private methods' do
    describe '#assistive_html_attributes' do
      subject { badge.send(:assistive_html_attributes) }
      context 'when as is :button' do
        let(:options) { { as: :button } }
        it { is_expected.to include(type: 'button') }
      end

      context 'when as is not button' do
        let(:options) { { as: :p } }
        it { is_expected.not_to include(type: 'button') }
      end
    end

    describe '#automatic_as' do
      subject { badge.send(:automatic_as) }
      context 'when href is included within the options' do
        let(:options) { { href: 'test_href' } }
        it { is_expected.to eq :a }
      end

      context 'when a :type with value :submit is present in the options' do
        let(:options) { { type: 'submit' } }
        it { is_expected.to eq :button }
      end

      context 'when neither href or submit type are present in options' do
        let(:options) { {} }
        it { is_expected.to eq :span }
      end

      context 'when href is nil' do
        let(:options) { { href: nil } }
        it { is_expected.to eq :span }
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
end
