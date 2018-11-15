require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Utilities::Alignable do
  # Nav is Alignable
  let(:nav) { FactoryBot.create(:bootstrap_nav, **options) }
  let(:options) { {} }

  describe '#center' do
    subject { nav.center }
    context 'when center is true' do
      let(:options) { { center: true } }
      it { is_expected.to be }
    end

    context 'when center is false' do
      let(:options) { { center: false } }
      it { is_expected.not_to be }
    end

    context 'when center is not set' do
      let(:options) { {} }
      it { is_expected.not_to be }
    end
  end

  describe '#right' do
    subject { nav.right }
    context 'when right is true' do
      let(:options) { { right: true } }
      it { is_expected.to be }
    end

    context 'when right is false' do
      let(:options) { { right: false } }
      it { is_expected.not_to be }
    end

    context 'when right is not set' do
      let(:options) { {} }
      it { is_expected.not_to be }
    end
  end

  describe 'private methods' do
    describe '#css_classes' do
      subject { nav.send(:css_classes) }

      describe ':center option' do
        context 'when center is true' do
          let(:options) { { center: true } }
          it { is_expected.to include 'justify-content-center' }
        end

        context 'when center is false' do
          let(:options) { { center: false } }
          it { is_expected.not_to include 'justify-content-center' }
        end

        context 'when center is not set' do
          let(:options) { {} }
          it { is_expected.not_to include 'justify-content-center' }
        end
      end

      describe ':right option' do
        context 'when right is true' do
          let(:options) { { right: true } }
          it { is_expected.to include 'justify-content-end' }
        end

        context 'when right is false' do
          let(:options) { { right: false } }
          it { is_expected.not_to include 'justify-content-end' }
        end

        context 'when right is not set' do
          let(:options) { {} }
          it { is_expected.not_to include 'justify-content-end' }
        end
      end
    end

    describe '#non_html_attribute_options' do
      subject { nav.send(:non_html_attribute_options) }
      it { is_expected.to include :center, :right }
    end
  end
end
