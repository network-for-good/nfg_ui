require 'rails_helper'

RSpec.describe NfgUi::Components::Foundations::Icon do
  let(:icon) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  let(:left_icon_spacer_css_class) { NfgUi::Components::Foundations::Icon::LEFT_ICON_SPACER_CSS_CLASS }
  let(:right_icon_spacer_css_class) { NfgUi::Components::Foundations::Icon::RIGHT_ICON_SPACER_CSS_CLASS }

  it { expect(described_class).to be < NfgUi::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Themeable utility module', component_suite: :nfg
  it_behaves_like 'a component that includes the Theme trait module'

  it { expect(described_class).to include NfgUi::Components::Traits::Icon }

  describe 'Icon class constants' do
    describe 'icon spacer css classes' do
      it 'is the correct spacer css class' do
        and_it 'is the correct left spacer css class' do
          expect(left_icon_spacer_css_class).to eq 'mr-1'
        end

        and_it 'is the correct right spacer css class' do
          expect(right_icon_spacer_css_class).to eq 'ml-1'
        end
      end
    end
  end

  describe '#icon' do
    let(:tested_traits_icon) { 'heart' }
    let(:tested_options_icon) { 'rocket' }
    let(:tested_icon) { nil }
    let(:tested_traits) { [] }
    let(:options) { { traits: tested_traits, icon: tested_icon } }
    subject { icon.icon }

    context 'when :icon is present in :options' do
      let(:tested_icon) { tested_options_icon }
      it { is_expected.to eq tested_options_icon }
    end

    context 'when :icon is not present in options' do
      context 'and when traits are present' do
        context 'and when the first trait is a string' do
          let(:tested_traits) { [tested_traits_icon] }

          it { is_expected.to eq tested_traits_icon }
        end

        context 'and when the first trait is not a string' do
          let(:tested_traits) { [:invalid_trait] }
          it { is_expected.to be_nil }
        end
      end

      context 'and when traits are not present' do
        let(:tested_traits) { [] }
        it { is_expected.to be_nil }
      end
    end
  end

  describe '#render' do
    let(:tested_icon) { 'heart' }
    let(:tested_traits) { [] }
    let(:tested_text) { nil }
    let(:options) { { traits: [tested_icon, *tested_traits], text: tested_text } }
    subject { icon.render }

    it 'renders an accessibility friendly font-awesome icon' do
      expect(subject).to eq "<i aria-hidden=\"true\" class=\"fa fa-heart\"></i>"

      # Because this is an important thing to ensure is there, despite what it may equal above:
      and_it 'includes the aria-hidden accessibility HTML attribute' do
        expect(subject).to include "aria-hidden=\"true\""
      end
    end

    describe 'an icon with :text' do
      let(:tested_text) { 'tested text' }

      context 'when :text is present in options' do
        it 'renders the icon with text' do
          expect(subject).to eq "<i aria-hidden=\"true\" class=\"fa fa-#{tested_icon} #{left_icon_spacer_css_class}\"></i> #{tested_text}"

          and_it 'adds the left spacer css class' do
            expect(substring_present?(string: subject, starting_substring: "class=\"", ending_substring: "\"", sought_substring: left_icon_spacer_css_class)).to be
          end

          and_it 'does not add the right spacer css class' do
            expect(substring_present?(string: subject, starting_substring: "class=\"", ending_substring: "\"", sought_substring: right_icon_spacer_css_class)).not_to be
          end
        end
      end

      context 'when :text is not present in options' do
        let(:tested_text) { nil }
        it 'renders an icon without text' do
          and_it 'does not add a spacer css class' do
            expect(substring_present?(string: subject, starting_substring: "class=\"", ending_substring: "\"", sought_substring: [left_icon_spacer_css_class, right_icon_spacer_css_class])).not_to be
          end
        end
      end
    end

    describe 'icons with registered traits' do
      context 'and when a registered `NfgUi::Components::Traits` trait is present in the icon :traits' do

        context 'and when an icon includes a registered trait that overrides the supplied icon string' do
          let(:tested_traits_icon) { nil }
          let(:tested_options_icon) { nil }
          let(:destructive_trait) { :loader }
          let(:destructive_trait_output) { 'fa fa-spinner fa-spin fa-fw' }


          context 'and when the icon is supplied as a trait' do
            let(:tested_traits_icon) { 'heart' }
            let(:options) { { traits: [tested_traits_icon, destructive_trait] } }

            it 'ignores the supplied :trait icon and utilizes the destrutive traits updated options[:icon]' do

              and_it 'renders the correct icon' do
                expect(subject).to eq "<i aria-hidden=\"true\" class=\"#{destructive_trait_output}\"></i>"
              end

              and_it 'includes the correct css classes from the destructive trait' do
                expect(substring_present?(string: subject, starting_substring: "class=\"", ending_substring: "\"", sought_substring: destructive_trait_output)).to be
              end

              and_it 'does not include the tested :traits icon' do
                expect(substring_present?(string: subject, starting_substring: "class=\"", ending_substring: "\"", sought_substring: tested_traits_icon)).not_to be
              end
            end
          end

          context 'and when the icon is supplied as an option' do
            let(:tested_options_icon) { 'hammer' }
            let(:options) { { icon: tested_options_icon, traits: [destructive_trait] } }

            it 'ignores the supplied :options icon and utilizes the destrutive traits updated options[:icon]' do

              and_it 'renders the correct icon' do
                expect(subject).to eq "<i aria-hidden=\"true\" class=\"#{destructive_trait_output}\"></i>"
              end

              and_it 'includes the correct css classes from the destructive trait' do
                expect(substring_present?(string: subject, starting_substring: "class=\"", ending_substring: "\"", sought_substring: destructive_trait_output)).to be
              end

              and_it 'does not include the tested :options icon' do
                expect(substring_present?(string: subject, starting_substring: "class=\"", ending_substring: "\"", sought_substring: tested_options_icon)).not_to be
              end
            end

          end

          context 'and when the component has multiple icons declared -- one in options and another in traits' do
            let(:tested_options_icon) { 'options-icon' }
            let(:tested_traits_icon) { 'traits-icon' }
            let(:options) { { icon: tested_options_icon, traits: [tested_traits_icon, destructive_trait] } }

            it 'overwrites the supplied icon and utilizes the trait' do

              and_it 'renders the correct icon' do
                expect(subject).to eq "<i aria-hidden=\"true\" class=\"#{destructive_trait_output}\"></i>"
              end

              and_it 'includes the correct css classes from the destructive trait' do
                expect(substring_present?(string: subject, starting_substring: "class=\"", ending_substring: "\"", sought_substring: destructive_trait_output)).to be
              end

              and_it 'does not include the tested :options icon' do
                expect(substring_present?(string: subject, starting_substring: "class=\"", ending_substring: "\"", sought_substring: tested_options_icon)).not_to be
              end

              and_it 'does not include the tested :traits icon' do
                expect(substring_present?(string: subject, starting_substring: "class=\"", ending_substring: "\"", sought_substring: tested_traits_icon)).not_to be
              end
            end
          end
        end

        context 'and when an icon includes a registered trait that does not override the supplied icon string' do
          let(:tested_theme_trait) { :danger }
          let(:expected_trait_css_class_output) { "text-#{tested_theme_trait}" }
          let(:tested_icon) { 'planet' }
          let(:options) { { traits: [tested_icon, tested_theme_trait] } }

          it 'updates the icon utilizing the trait settings' do

            expect(subject).to eq "<i aria-hidden=\"true\" class=\"fa fa-#{tested_icon} #{expected_trait_css_class_output}\"></i>"

            by 'updating the icon to include the trait enhancement' do
              expect(substring_present?(string: subject, starting_substring: "class=\"", ending_substring: "\"", sought_substring: expected_trait_css_class_output)).to be
            end

            and_it 'renders the supplied icon' do
              expect(substring_present?(string: subject, starting_substring: "class=\"", ending_substring: "\"", sought_substring: tested_icon)).to be
            end

          end
        end
      end

      context 'and when a :right is present in options' do
        let(:options) { { traits: [tested_icon], right: tested_right, text: tested_text } }
        let(:tested_text) { nil }
        let(:tested_right) { nil }
        let(:tested_icon) { 'moon' }

        context 'when text is present' do
          let(:tested_text) { 'tested text' }
          let(:tested_right) { true }
          it 'renders the icon on the right side of the text' do
            expect(subject).to eq "#{tested_text} <i aria-hidden=\"true\" class=\"fa fa-#{tested_icon} #{right_icon_spacer_css_class}\"></i>"
          end
        end

        context 'when text is not present' do
          let(:tested_text) { nil }

          it 'does not update the icon to include the right: true enhancements' do
            expect(subject).to eq "<i aria-hidden=\"true\" class=\"fa fa-#{tested_icon}\"></i>"

            and_it 'does not add a spacer class' do
              expect(substring_present?(string: subject, starting_substring: "class=\"", ending_substring: "\"", sought_substring: [left_icon_spacer_css_class, right_icon_spacer_css_class])).not_to be
            end
          end
        end
      end

      context 'and when :right is not present in options' do
        let(:right_trait) { nil }
        let(:tested_text) { nil }
        let(:tested_icon) { 'star' }
        let(:options) { { traits: [tested_icon, right_trait], text: tested_text } }

        context 'and when :right is present in traits' do
          let(:right_trait) { :right }

          context 'when :text is present' do
            let(:tested_text) { 'tested text' }

            it 'renders the icon on the right side of the text' do
              expect(subject).to eq "#{tested_text} <i aria-hidden=\"true\" class=\"fa fa-#{tested_icon} #{right_icon_spacer_css_class}\"></i>"
            end
          end

          context 'when :text is not present' do
            let(:tested_text) { nil }

            it 'does not update the icon to include the :right trait enhancements' do

              expect(subject).to eq "<i aria-hidden=\"true\" class=\"fa fa-#{tested_icon}\"></i>"

              and_it 'does not add a spacer class' do
                expect(substring_present?(string: subject, starting_substring: "class=\"", ending_substring: "\"", sought_substring: right_icon_spacer_css_class)).not_to be
              end
            end
          end
        end

        context 'and when :right is not present in traits' do
          it 'renders the icon without :right icon enhancements' do
            expect(substring_present?(string: subject, starting_substring: "class=\"", ending_substring: "\"", sought_substring: [ right_icon_spacer_css_class])).not_to be
          end
        end
      end
    end
  end

  describe '#right' do
    subject { icon.right }
    let(:tested_right) { nil }
    let(:options) { { right: tested_right } }

    context 'when right is present in options' do
      let(:tested_right) { true }
      it { is_expected.to eq tested_right }
    end

    context 'when :right is nil in options' do
      let(:tested_right) { nil }
      it { is_expected.to be_nil }
    end

    context 'when :right is not present in options' do
      let(:options) { {} }
      it { is_expected.to be false }
    end
  end

  describe '#text' do
    let(:tested_text) { nil }
    let(:options) { { text: tested_text } }

    subject { icon.text }

    context 'when text is present in options' do
      let(:tested_text) { 'tested text' }
      it { is_expected.to eq tested_text }
    end

    context 'when :text is nil in options' do
      let(:tested_text) { nil }
      it { is_expected.to be_nil }
    end

    context 'when :text is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe 'private methods' do
    describe '#add_left_icon_css_spacer_class?' do
      let(:tested_text) { nil }
      let(:tested_right) { nil }
      let(:options) { { right: tested_right, text: tested_text } }

      subject { icon.send(:add_left_icon_css_spacer_class?) }

      context 'when :right is true' do
        let(:tested_right) { true }
        it { is_expected.not_to be }
      end

      context 'when :right is false' do
        let(:tested_right) { false }
        context 'and when :text is present in options' do
          let(:tested_text) { 'tested text' }
          it { is_expected.to be }
        end

        context 'and when :text is not present in options' do
          let(:tested_text) { nil }
          it { is_expected.not_to be }
        end
      end
    end

    describe '#add_right_icon_css_spacer_class?' do
      let(:tested_text) { nil }
      let(:tested_right) { nil }
      let(:options) { { right: tested_right, text: tested_text } }

      subject { icon.send(:add_right_icon_css_spacer_class?) }

      context 'when :right is false' do
        let(:tested_right) { false }
        it { is_expected.not_to be }
      end

      context 'when :right is true' do
        let(:tested_right) { true }
        context 'and when :text is present in options' do
          let(:tested_text) { 'tested text' }
          it { is_expected.to be }
        end

        context 'and when :text is not present in options' do
          let(:tested_text) { nil }
          it { is_expected.not_to be }
        end
      end
    end

    describe '#css_classes' do
      subject { icon.send(:css_classes) }

      context 'when text is present' do
        let(:options) { { text: 'tested text', icon: 'pasture', right: tested_right } }
        context 'when right is true' do
          let(:tested_right) { true }
          it { is_expected.not_to include left_icon_spacer_css_class }
          it { is_expected.to include right_icon_spacer_css_class }
        end

        context 'when right is falsey' do
          let(:tested_right) { false }
          it { is_expected.to include left_icon_spacer_css_class }
          it { is_expected.not_to include right_icon_spacer_css_class }
        end
      end

      context 'when text is not present' do
        let(:options) { { icon: 'pasture', right: tested_right } }
        context 'when right is true' do
          let(:tested_right) { true }
          it 'does not add any spacer css classes' do
            by 'not including the left spacer css class' do
              expect(subject).not_to include left_icon_spacer_css_class
            end

            and_by 'not including the right spacer css class' do
              expect(subject).not_to include right_icon_spacer_css_class
            end
          end
        end

        context 'when right is falsey' do
          let(:tested_right) { false }
          it { is_expected.not_to include right_icon_spacer_css_class }
          it { is_expected.not_to include right_icon_spacer_css_class }
        end
      end
    end

    describe '#theme_css_class_prefix' do
      subject { icon.send(:theme_css_class_prefix) }
      it { is_expected.to eq 'text-' }
    end

    describe '#default_theme' do
      subject { icon.send(:default_theme) }
      it { is_expected.to be_nil }
    end

    describe '#non_html_attribute_options' do
      subject { icon.send(:non_html_attribute_options) }
      it { is_expected.to include(:right, :text, :icon) }
    end

    describe '#outlineable?' do
      subject { icon.send(:outlineable?) }
      it { is_expected.not_to be }
    end
  end
end
