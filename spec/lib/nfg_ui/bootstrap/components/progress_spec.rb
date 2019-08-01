require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Progress do
  let(:progress) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }

  it_behaves_like 'a component with a consistent initalized construction'

  it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::Progressable }

  describe '#component_family' do
    subject { progress.component_family }
    it { is_expected.to eq :progress }
  end

  describe '#height' do
    let(:tested_option) { :height }
    subject { progress.height }
    it_behaves_like 'a fetched option with a defined fallback', fallback: nil
  end

  describe '#render' do
    pending 'coming soon'
  end

  describe '#style' do
    subject { progress.style }
    let(:tested_height) { nil }
    let(:options) { { height: tested_height } }

    context 'when :height is present in options' do
      let(:tested_height) { 123 }
      it { is_expected.to eq "height: #{tested_height}px;" }
    end

    context 'when :height is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_blank }
    end

    context 'when :height is nil in options' do
      let(:tested_height) { nil }
      it { is_expected.to be_blank }
    end
  end

  describe '#non_html_attribute_options' do
    subject { progress.send(:non_html_attribute_options) }
    it { is_expected.to include :height }
  end
end
