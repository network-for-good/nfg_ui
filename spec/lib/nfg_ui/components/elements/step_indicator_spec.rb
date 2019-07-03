require 'rails_helper'

RSpec.describe NfgUi::Components::Elements::StepIndicator do
  let(:step_indicator) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Components::Elements::NavLink }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Wrappable utility module', component_suite: :nfg

  describe '#component_family' do
    subject { step_indicator.component_family }
    it { is_expected.to eq :steps }
  end

  describe '#step' do
    let(:options) { { step: tested_step } }
    let(:tested_step) { nil }
    subject { step_indicator.step }

    context 'when :step is present in options' do
      let(:tested_step) { 'tested step' }
      it { is_expected.to eq tested_step }
    end

    context 'when :step is nil in options' do
      let(:tested_step) { nil }
      it { is_expected.to be_nil }
    end

    context 'when :step is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#render' do
    subject { step_indicator.render }
    it 'renders the base component without options' do
      expect(subject).to eq "<span class=\"nav-link\"><div class=\"step-indicator\"></div></span>"
    end

    describe 'influencing the content_tag :as option for human accessibility' do
      context 'rendering a step indicator as a link' do
        let(:tested_href) { '#tested_href' }
        let(:options) { { href: tested_href } }

        it 'is a link with an href' do
          expect(subject).to include "<a class=\"nav-link\" href=\"#{tested_href}\">"

          and_it 'does not render the step indicator as a span' do
            expect(subject).not_to include "<span class=\"nav-link\""
          end
        end
      end

      context 'rendering a step indicator as a span' do
        it 'is not a link with an href' do
          and_it 'renders the step indicator as a span without an href' do
            expect(subject).to include "<span class=\"nav-link\">"
          end

          and_it 'does not render the step indicator as an anchor link' do
            expect(subject).not_to include "<a class=\"nav-link\""
          end
        end
      end
    end

    describe 'rendering the content in the .step-indicator' do
      let(:options) { { icon: tested_icon, step: tested_step } }
      let(:tested_step) { nil }
      let(:tested_icon) { nil }

      context 'when :icon is present in options' do
        let(:tested_icon) { 'rocket' }

        context 'and when :step is also present in options' do
          let(:tested_step) { 'arbitrary' }

          it 'ignores the :step option and renders the icon, instead in the indicator' do

            expect(subject).to include "<span class=\"nav-link\"><div class=\"step-indicator\"><i aria-hidden=\"true\" class=\"fa fa-rocket\"></i></div>"

            and_it 'does not include the step text' do
              expect(subject).not_to include tested_step
            end

            and_it 'does include the icon' do
              expect(subject).to include tested_icon
            end
          end
        end

        context 'and when :step is not present in options' do
          let(:tested_step) { nil }
          it 'renders the icon in the step indicator' do
            expect(subject).to eq "<span class=\"nav-link\"><div class=\"step-indicator\"><i aria-hidden=\"true\" class=\"fa fa-rocket\"></i></div></span>"
          end
        end
      end

      context 'when :icon is not present in options' do
        let(:tested_icon) { nil }

        context 'when :step is present in options' do
          let(:tested_step) { 'tested step' }
          it 'renders the .step-indicator with the step' do
            expect(subject).to include "<div class=\"step-indicator\">#{tested_step}</div>"
          end
        end

        context 'when :step is not present in options' do
          let(:tested_step) { nil }
          it 'renders the .step-indicator with no content' do
            expect(subject).to include "<div class=\"step-indicator\"></div>"
          end
        end
      end
    end

    describe 'rendering a :body for the step indicator' do
      let(:tested_body) { nil }
      let(:options) { { body: tested_body } }

      context 'when :body is present in options' do
        let(:tested_body) { 'tested body' }
        it 'renders the body within the caption typeface' do
          expect(subject).to include "<p class=\"mt-1 mb-0 step-text text-muted font-size-sm\">#{tested_body}</p>"
        end
      end

      context 'when :body is not present in options' do
        let(:tested_body) { nil }
        it 'does not render the caption typeface' do
          expect(subject).not_to include "<p class=\"mt-1 mb-0 step-text text-muted font-size-sm\">"
          expect(subject).to eq "<span class=\"nav-link\"><div class=\"step-indicator\"></div></span>"
        end
      end
    end
  end

  describe 'private methods' do
    describe '#default_html_wrapper_element' do
      subject { step_indicator.send(:default_html_wrapper_element) }
      it { is_expected.to eq :span }
    end

    describe '#non_html_attribute_options' do
      subject { step_indicator.send(:non_html_attribute_options) }
      it { is_expected.to include :step }
    end
  end
end
