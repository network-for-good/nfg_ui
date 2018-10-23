require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Navbar do
  let(:navbar) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Wrappable utility module'
  it_behaves_like 'a component that includes the Themeable utility module'

  describe '#expand' do
    subject { navbar.expand }
    context 'when expand is present in options' do
      let(:tested_expand) { :test }
      let(:options) { { expand: tested_expand } }
      it { is_expected.to eq tested_expand }
    end

    context 'when expand is nil in options' do
      let(:options) { { expand: nil } }
      it { is_expected.to be_nil }
    end

    context 'when expand is not present in options' do
      let(:options) { {} }
      it { is_expected.to eq :lg }
    end
  end

  describe '#light' do
    subject { navbar.light }
    context 'when light is true in options' do
      let(:options) { { light: true } }
      it { is_expected.to be }
    end

    context 'when light is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  

  describe '#dark' do
    subject { navbar.dark }
    context 'when dark is true in options' do
      let(:options) { { dark: true } }
      it { is_expected.to be }
    end

    context 'when dark is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#sticky' do
    subject { navbar.sticky }
    context 'when sticky is present in options' do
      let(:tested_sticky) { :top }
      let(:options) { { sticky: tested_sticky } }
      it { is_expected.to eq tested_sticky }
    end

    context 'when sticky is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#fixed' do
    subject { navbar.fixed }
    context 'when fixed is present in options' do
      let(:tested_fixed) { :top }
      let(:options) { { fixed: tested_fixed } }
      it { is_expected.to eq tested_fixed }
    end

    context 'when fixed is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#assistive_html_attributes' do
    subject { navbar.send(:assistive_html_attributes) }
    context 'when the navbar is wrapped by a <nav> element' do
      let(:options) { { as: :nav } }
      it { is_expected.to eq({}) }
    end

    context 'when the navbar is not wrapped by a <nav> element' do
      let(:options) { { as: :div } }
      it { is_expected.to eq(role: 'navigation') }
    end
  end

  describe '#component_family' do
    subject { navbar.component_family }
    it { is_expected.to eq :navbar }
  end

  describe '#default_html_wrapper_element' do
    subject { navbar.send(:default_html_wrapper_element) }
    it { is_expected.to eq :nav }
  end

  describe '#css_classes' do
    subject { navbar.send(:css_classes) }
    describe ':expand option' do
      context 'when :expand is present in the options' do
        let(:tested_expand) { :sm }
        let(:options) { { expand: tested_expand } }
        it { is_expected.to include "navbar-expand-#{tested_expand}" }
      end

      context 'when :expand is nil in the options' do
        let(:tested_expand) { :nil }
        let(:options) { { expand: tested_expand } }
        it 'does not apply the default expand class' do
          expect(subject).not_to include 'navbar-expand-lg'
        end
      end

      context 'when :expand is not present in the options' do
        let(:options) { {} }
        it { is_expected.to include 'navbar-expand-lg' }
      end
    end

    describe 'sticky top option' do
      context 'when sticky is set to top' do
        let(:options) { { sticky: :top } }
        it { is_expected.to include 'sticky-top' }
      end

      context 'when sticky is not set to top' do
        let(:options) { { sticky: :bottom } }
        it { is_expected.not_to include 'sticky-top' }
      end
    end

    describe 'fixed top option' do
      context 'when fixed is set to top' do
        let(:options) { { fixed: :top } }
        it { is_expected.to include 'fixed-top' }
      end

      context 'when fixed is not set to top (or bottom)' do
        let(:options) { { fixed: :arbitrary } }
        it { is_expected.not_to include 'fixed-top' }
        it { is_expected.not_to include 'fixed-bottom' }
      end
    end

    describe 'fixed bottom option' do
      context 'when fixed is set to bottom' do
        let(:options) { { fixed: :bottom } }
        it { is_expected.to include 'fixed-bottom' }
      end

      context 'when fixed is not set to bottom (or bottom)' do
        let(:options) { { fixed: :arbitrary } }
        it { is_expected.not_to include 'fixed-top' }
        it { is_expected.not_to include 'fixed-bottom' }
      end
    end

    describe 'dark or light navbar css class' do
      context 'when navbar is any of the dark-ish color themes' do
        let(:options) { { theme: :dark, **secondary_options } }
        let(:secondary_options) { {} }

        it { is_expected.to include 'navbar-dark' }
        it { is_expected.not_to include 'navbar-light' }

        context 'and when dark is true in options' do
          let(:secondary_options) { { dark: true } }
          it { is_expected.to include 'navbar-dark' }
          it { is_expected.not_to include 'navbar-light' }
        end

        context 'and when light is true in options' do
          let(:secondary_options) { { light: true } }
          it { is_expected.to include 'navbar-light' }
          it { is_expected.not_to include 'navbar-dark' }
        end
      end

      context 'when navbar is light color themes' do
        let(:options) { { theme: :light, **secondary_options } }
        let(:secondary_options) { {} }
        it { is_expected.to include 'navbar-light' }
        it { is_expected.not_to include 'navbar-dark' }

        context 'and when dark is true in options' do
          let(:secondary_options) { { dark: true } }
          it { is_expected.to include 'navbar-dark' }
          it { is_expected.not_to include 'navbar-light' }
        end

        context 'and when light is true in options' do
          let(:secondary_options) { { light: true } }
          it { is_expected.to include 'navbar-light' }
          it { is_expected.not_to include 'navbar-dark' }
        end
      end
    end
  end

  describe '#dark_or_light_navbar_css_class' do
    subject { navbar.send(:dark_or_light_navbar_css_class) }
    context 'when dark is true in options' do
      let(:options) { { dark: true } }
      it { is_expected.to eq 'navbar-dark' }
    end

    context 'when light is true in options' do
      let(:options) { { light: true } }
      it { is_expected.to eq 'navbar-light' }
    end

    context 'when neither light or dark are present in options' do
      context 'and when the theme is a visually dark theme' do
        let(:options) { { theme: :dark } }
        it { is_expected.to eq 'navbar-dark' }
      end

      context 'and when the theme is a visually light theme' do
        let(:options) { { theme: :light } }
        it { is_expected.to eq 'navbar-light' }
      end

      context 'and when no theme is present in options' do
        let(:options) { {} }
        it { is_expected.to eq 'navbar-light' }
      end
    end
  end

  describe '#default_theme' do
    subject { navbar.send(:default_theme) }
    it { is_expected.to eq :light }
  end

  describe '#theme_css_class_prefix' do
    subject { navbar.send(:theme_css_class_prefix) }
    it { is_expected.to eq 'bg-' }
  end

  describe '#non_html_attribute_options' do
    subject { navbar.send(:non_html_attribute_options) }
    it { is_expected.to include :dark, :expand, :right, :left, :light }
  end

  describe '#dark_themes' do
    subject { navbar.send(:dark_themes) }
    it { is_expected.to eq %i[primary secondary success danger warning info dark] }
  end
end
