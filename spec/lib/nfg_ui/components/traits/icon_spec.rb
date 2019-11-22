require 'rails_helper'

RSpec.describe NfgUi::Components::Traits::Icon do
  let(:component_with_traits) { NfgUi::Components::Foundations::Icon.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  describe 'registered traits' do
    subject { described_class::TRAITS }
    it { is_expected.to eq %i[loader tip] }
  end

  describe '#loader_trait' do
    subject { component_with_traits.loader_trait }
    it 'updates the icon to use a spinning spinner' do
      by 'not updating the icon before the trait is applied' do
        expect(component_with_traits.icon).not_to eq 'spinner spin fw'
      end

      and_by 'running the trait' do
        subject # run the trait
      end

      and_it 'is the correct icon' do
        expect(component_with_traits.icon).to eq 'spinner spin fw'
      end
    end
  end

  describe '#tip_trait' do
    subject { component_with_traits.tip_trait }

    describe 'updating the icon :class option' do
      context 'when the icon has text' do
        let(:test_css_class) { 'test-class' }
        let(:options) { { text: 'test', class: test_css_class } }

        it 'includes the custom css class' do
          and_by 'running the trait' do
            subject # run the trait
          end

          and_it 'includes the css class' do
            expect(component_with_traits.options[:class]).to include 'fa-fw'
          end

          and_it 'adds a space between the pre-supplied css class' do
            expect(component_with_traits.options[:class]).to include(test_css_class, ' fa-fw')
          end

          and_it 'is :right' do
            expect(component_with_traits.right).to be
          end
        end
      end

      context 'when the icon does not have text' do
        let(:options) { { text: nil } }

        it 'does not implement text-based updates' do
          and_by 'running the trait' do
            subject # run the trait
          end

          and_it 'is not :right' do
            expect(component_with_traits.right).not_to be
          end

          and_it 'does not include the text spacer css class' do
            expect(component_with_traits.options[:class]).not_to include 'fa-fw'
          end
        end
      end
    end

    it 'establishes the tip icon with correct options' do
      by 'not being updated before running the trait' do
        expect(component_with_traits.icon).not_to eq NfgUi::DEFAULT_TIP_ICON
        expect(component_with_traits.theme).not_to eq NfgUi::DEFAULT_TIP_THEME
      end

      and_by 'running the trait' do
        subject # run the trait
      end

      and_it 'is the correct icon' do
        expect(component_with_traits.icon).to eq NfgUi::DEFAULT_TIP_ICON
      end

      and_it 'is the correct theme' do
        expect(component_with_traits.theme).to eq NfgUi::DEFAULT_TIP_THEME
      end
    end

    context 'when options are preset in the options hash that compete with trait updates' do
      let(:test_icon) { nil }
      let(:test_theme) { nil }
      let(:test_right) { nil }
      let(:options) { { icon: test_icon, theme: test_theme, right: test_right } }

      describe ':icon' do
        let(:test_icon) { 'test-icon' }

        it 'does not overwrite the supplied icon' do
          subject
          expect(component_with_traits.icon).not_to eq NfgUi::DEFAULT_TIP_ICON

          expect(component_with_traits.icon).to eq test_icon
        end
      end

      describe ':theme' do
        let(:test_theme) { :danger }

        it 'does not overwrite the supplied icon' do
          subject
          expect(component_with_traits.theme).not_to eq NfgUi::DEFAULT_TIP_THEME

          expect(component_with_traits.theme).to eq test_theme
        end
      end

      describe ':right' do
        let(:test_right) { false }

        it 'does not overwrite the supplied icon' do
          subject
          expect(component_with_traits.right).not_to eq true

          expect(component_with_traits.right).to eq test_right
        end
      end
    end
  end
end
