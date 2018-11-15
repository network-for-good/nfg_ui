require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Card do
  let(:card) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Themeable utility module', component_suite: :bootstrap

  describe '#component_family' do
    subject { card.component_family }
    it { is_expected.to eq :card }
  end

  describe '#footer' do
    subject { card.footer }
    context 'when footer is present in options' do
      let(:tested_footer) { 'Tested Subtitle' }
      let(:options) { { footer: tested_footer } }
      it { is_expected.to eq tested_footer }
    end

    context 'when footer is not present in options' do
      let(:options) { {} }
      it { is_expected.to eq '' }
    end
  end

  describe '#heading' do
    subject { card.heading }
    context 'when heading is supplied in :options' do
      let(:test_heading) { 'test heading' }
      let(:options) { { heading: test_heading } }
      it { is_expected.to eq test_heading }
    end

    context 'when heading is not supplied in options' do
      let(:options) { {} }
      it { is_expected.to eq '' }
    end
  end

  describe '#subtitle' do
    subject { card.subtitle }
    context 'when subtitle is present in options' do
      let(:tested_subtitle) { 'Tested Subtitle' }
      let(:options) { { subtitle: tested_subtitle } }
      it { is_expected.to eq tested_subtitle }
    end

    context 'when subtitle is not present in options' do
      let(:options) { {} }
      it { is_expected.to eq '' }
    end
  end

  describe '#title' do
    subject { card.title }
    context 'when title is present in options' do
      let(:tested_title) { 'Tested Title' }
      let(:options) { { title: tested_title } }
      it { is_expected.to eq tested_title }
    end

    context 'when title is not present in options' do
      let(:options) { {} }
      it { is_expected.to eq '' }
    end
  end

  describe 'private methods' do
    describe '#css_classes' do
      subject { card.send(:css_classes) }
      let(:options) { { theme: tested_theme, outlined: tested_outline } }
      let(:tested_theme) { nil }
      let(:tested_outline) { false }

      context 'when theme is present' do
        context 'when theme is not :light' do
          let(:tested_theme) { :secondary }

          context 'when outlined is true' do
            let(:tested_outline) { true }
            it { is_expected.to include "text-#{tested_theme}" }
            it { is_expected.not_to include 'text-white' }
          end

          context 'when outlined is false' do
            let(:tested_outline) { false }
            it { is_expected.to include 'text-white' }
            it { is_expected.not_to include "text-#{tested_theme}" }
          end
        end

        context 'when theme is :light' do
          let(:tested_theme) { :light }
          it { is_expected.not_to include 'text-white' }
          it { is_expected.not_to include "text-#{tested_theme}" }
        end
      end
    end

    describe '#default_theme' do
      subject { card.send(:default_theme) }
      it { is_expected.to be_nil }
    end

    describe '#non_html_attribute_options' do
      subject { card.send(:non_html_attribute_options) }
      it { is_expected.to include :footer, :heading, :subtitle, :title }
    end

    describe '#outlined_css_class_prefix' do
      subject { card.send(:outlined_css_class_prefix) }
      it { is_expected.to eq 'border-' }
    end

    describe '#theme_css_class_prefix' do
      subject { card.send(:theme_css_class_prefix) }
      context 'when card has outlined set to true in options' do
        let(:options) { { outlined: true } }
        it { is_expected.to eq '' }
      end

      context 'when card is not outlined' do
        let(:options) { { outlined: false } }
        it { is_expected.to eq 'bg-' }
      end
    end
  end
end
