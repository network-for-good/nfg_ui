require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Utilities::Themeable do
  # Alert is themeable
  let(:alert) { FactoryBot.create(:bootstrap_alert, **options) }
  let(:options) { {} }
  let(:options_with_theme) { { theme: theme } }
  let(:options_with_outlined) { { outlined: outlined } }
  let(:options_with_themeable) { { **options_with_theme, **options_with_outlined } }

  let(:theme) { nil }
  let(:tested_theme) { NfgUi::BOOTSTRAP_THEMES.sample(1).first }
  let(:outlined) { nil }
  let(:tested_outlined) { true }

  describe '#theme' do
    subject { alert.theme }
    context 'when a theme is supplied' do
      let(:theme) { tested_theme }
      let(:options) { options_with_theme }

      it { is_expected.to eq tested_theme }
    end

    context 'when a theme is set as nil' do
      let(:theme) { nil }
      let(:options) { options_with_theme }

      it { is_expected.to be_nil }
    end

    context 'when a theme is not supplied' do
      let(:options) { {} }
      it { is_expected.to eq :primary }
    end
  end

  describe '#outlined' do
    subject { alert.outlined }
    context 'when a outlined is supplied' do
      let(:outlined) { tested_outlined }
      let(:options) { options_with_outlined }
      it { is_expected.to eq tested_outlined }
    end

    context 'when a outlined is set as nil' do
      let(:outlined) { nil }
      let(:options) { options_with_outlined }
      it { is_expected.to be_nil }
    end

    context 'when a outlined is not supplied' do
      let(:options) { {} }
      it { is_expected.to be false }
    end
  end

  describe '#css_classes' do
    subject { alert.send(:css_classes) }
    context 'when theme is present' do
      let(:theme) { tested_theme }
      let(:options) { options_with_theme }

      context 'when outlined is true' do
        let(:outlined) { true }
        let(:options) { options_with_themeable }
        it { is_expected.to eq "alert alert-outline-#{tested_theme}" }
      end

      context 'when outlined is false / nil' do
        it { is_expected.to eq "alert alert-#{tested_theme}" }
      end
    end

    context 'when theme is manually set to nil' do
      let(:options) { { theme: nil } }
      it { is_expected.to eq 'alert' }
    end

    context 'when theme is not present' do
      let(:options) { {} }
      it { is_expected.to eq 'alert alert-primary' }

      context 'when outlined is true' do
        let(:outlined) { true }
        let(:options) { options_with_outlined }
        it { is_expected.to eq 'alert alert-outline-primary' }
      end

      context 'when outlined is false / nil' do
        it { is_expected.to eq 'alert alert-primary' }
      end
    end
  end

  describe '#non_html_attribute_options' do
    subject { alert.send(:non_html_attribute_options) }
    it { is_expected.to include(:theme, :outlined) }
  end

  describe '#outlined?' do
    subject { alert.send(:outlined?) }
    context 'when outlined is true' do
      let(:outlined) { true }
      let(:options) { options_with_outlined }
      it { is_expected.to be }
    end

    context 'when outlined is false' do
      let(:outlined) { false }
      let(:options) { options_with_outlined }
      it { is_expected.not_to be }
    end

    context 'when outlined is not present' do
      let(:options) { {} }
      it { is_expected.to be_falsey }
    end
  end

  describe '#default_theme' do
    subject { alert.send(:default_theme) }

    context 'when default_theme is not overwritten' do
      it { is_expected.to eq :primary }
    end

    context 'when default theme has been overwritten' do
      before { alert.instance_variable_set(:@default_theme, :secondary) }
      it { is_expected.to eq :secondary }
    end
  end

  describe '#outlined_prefix' do
    subject { alert.send(:outlined_prefix) }
    context 'when outlined? is true' do
      let(:options) { options_with_outlined }
      let(:outlined) { true }
      it { is_expected.to eq 'outline-' }
    end

    context 'when outlined? is false' do
      let(:options) { options_with_outlined }
      let(:outlined) { false }
      it { is_expected.to be_nil }
    end
  end
end
