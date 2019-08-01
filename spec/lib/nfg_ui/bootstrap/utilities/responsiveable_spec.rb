require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Utilities::Responsiveable do
  # Button is both disableable and tooltipable.
  let(:image) { NfgUi::Components::Foundations::Image.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  describe '#responsive' do
    let(:tested_option) { :responsive }
    subject { image.responsive }
    it_behaves_like 'a fetched option with a defined fallback', fallback: true # image is defaulted true
  end

  describe '#css_classes' do
    subject { image.send(:css_classes) }
    context 'when responsive is true' do
      let(:options) { { responsive: true } }
      it { is_expected.to include image.send(:responsive_css_class) }
    end

    context 'when responsive is false' do
      context 'when responsive is true' do
        let(:options) { { responsive: false } }
        it { is_expected.not_to include image.send(:responsive_css_class) }
      end
    end
  end
end