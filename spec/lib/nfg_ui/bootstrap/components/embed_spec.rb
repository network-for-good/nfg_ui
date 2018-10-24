require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Embed do
  let(:embed) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { { aspect_ratio: aspect_ratio, iframe: iframe, autoplay: autoplay } }

  let(:aspect_ratio) { nil }
  let(:tested_aspect_ratio) { '16:9' }  
  let(:iframe) { nil }
  let(:tested_iframe) { 'http://www.cnn.com' }
  let(:autoplay) { nil }
  let(:tested_autoplay) { true }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  
  describe '#aspect_ratio' do
    subject { embed.aspect_ratio }

    context 'when aspect ratio is set' do
      let(:aspect_ratio) { tested_aspect_ratio }
      it { is_expected.to eq tested_aspect_ratio }
    end

    context 'when aspect ratio is not set' do
      let(:aspect_ratio) { nil }
      it { is_expected.to eq '16:9' }
    end
  end

  describe '#iframe' do
    subject { embed.iframe }

    context 'when options include :iframe' do
      let(:iframe) { tested_iframe }
      it { is_expected.to eq "<iframe src=\"#{tested_iframe}\" class=\"embed-responsive-item\" allowfullscreen=\"allowfullscreen\"></iframe>" }
    end

    context 'when options do not include :iframe' do
      let(:iframe) { nil }
      it { is_expected.to be_nil }
    end
  end

  describe '#iframe?' do
    subject { embed.iframe? }

    context 'when options :iframe is present' do
      let(:iframe) { tested_iframe }
      it { is_expected.to be }
    end

    context 'when options :iframe is not present' do
      let(:iframe) { nil }
      it { is_expected.to be_falsey }
    end
  end

  describe '#autoplay' do
    subject { embed.autoplay }
    context 'when options :autoplay is true' do
      let(:autoplay) { true }
      it { is_expected.to be }
    end

    context 'when options :autoplay is false' do
      let(:autoplay) { false }
      it { is_expected.to be false }
    end

    context 'when options :autoplay is nil' do
      let(:autoplay) { nil }
      it { is_expected.to be nil }
    end

    context 'when options :autoplay is not present' do
      let(:options) { {} }
      it { is_expected.to be false }
    end
  end

  describe 'private methods' do
    describe '#component_css_class' do
      subject { embed.send(:component_css_class) }
      it { is_expected.to eq 'embed-responsive' }
    end

    describe '#css_classes' do
      subject { embed.send(:css_classes) }
      context 'when aspect_ratio is present' do
        context 'and when aspect ratio is included in the allowed_aspect_ratios array' do
          let(:aspect_ratio) { '21:9' }
          it { is_expected.to eq 'embed-responsive embed-responsive-21by9' }
        end

        context 'and when the aspect ratio is not included in the allowed_aspect_ratios array' do
          let(:aspect_ratio) { 'invalid' }
          it { is_expected.to eq 'embed-responsive' }
          it { is_expected.not_to include "embed-responsive-#{aspect_ratio}" }
        end
      end
    end

    describe '#allowed_aspect_ratios' do
      subject { embed.send(:allowed_aspect_ratios) }
      it { is_expected.to eq %w[21:9 16:9 4:3 1:1] }
    end

    describe '#default_aspect_ratio' do
      subject { embed.send(:default_aspect_ratio) }
      it { is_expected.to eq '16:9' }
    end

    describe '#non_html_attribute_options' do
      subject { embed.send(:non_html_attribute_options) }
      it { is_expected.to eq %i[body heading traits iframe aspect_ratio autoplay] }
    end

    describe '#default_autoplay' do
      subject { embed.send(:default_autoplay) }
      it { is_expected.to be false }
    end
  end
end
