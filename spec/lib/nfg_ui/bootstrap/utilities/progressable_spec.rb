require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Utilities::Progressable do
  let(:progress) { FactoryBot.create(:bootstrap_progress, **options) }
  let(:options) { {} }

  describe '#animated' do
    let(:tested_option) { :animated }
    subject { progress.animated }
    it_behaves_like 'a fetched option with a defined fallback', fallback: false
  end

  describe '#label' do
    subject { progress.label }

    context 'when :label is `true` in options' do
      context 'when :progress is present in options' do
        let(:tested_progress) { 10 }
        let(:options) { { label: true, progress: tested_progress } }
        it { is_expected.to eq "#{tested_progress}%" }
      end
      context 'when :progress is not present in options' do
        let(:options) { { label: true } }
        it { is_expected.to eq '0%' }
      end
    end

    context 'when :label is `false` in options' do
      context 'when :body is present in options' do
        let(:tested_body) { 'tested body' }
        let(:options) { { label: false, body: tested_body } }

        it { is_expected.to eq tested_body }
      end

      context 'and when :body is not present in options' do
        let(:options) { { label: false } }
        it { is_expected.to be_nil }
      end
    end

    context 'when :label present as a string in options' do
      let(:tested_label_string) { 'tested label string' }
      let(:options) { { label: tested_label_string } }

      it { is_expected.to eq tested_label_string }
    end
  end

  describe '#progress' do
    let(:tested_option) { :progress }
    subject { progress.progress }
    context 'when :progress is present in options' do
      let(:tested_progress) { 10 }
      let(:options) { { progress: tested_progress } }
      it { is_expected.to eq tested_progress }
    end

    context 'when :progress is not present in options' do
      let(:options) { {} }
      it { is_expected.to eq 0 }
    end
  end

  describe '#striped' do
    let(:tested_option) { :striped }
    subject { progress.striped }
    it_behaves_like 'a fetched option with a defined fallback', fallback: false
  end

  describe '#theme' do
    let(:tested_option) { :theme }
    subject { progress.theme }
    it_behaves_like 'a fetched option with a defined fallback', fallback: nil
  end

  describe '#non_html_attribute_options' do
    subject { progress.send(:non_html_attribute_options) }

    it { is_expected.to include :animated, :height, :label, :progress, :striped, :theme }
  end
end
