require 'rails_helper'

RSpec.describe NfgUi::Components::Elements::Step do
  let(:step) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Components::Elements::NavItem }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Describable utility module'
  it_behaves_like 'a component that includes the Renderable utility module'
  it_behaves_like 'a component that includes the Iconable utility module'
  it_behaves_like 'a component that includes the Activatable utility module', component_suite: :nfg

  describe '#active' do
    subject { step.active }
    let(:options) { { active: true } }
    context 'when :active is true in options' do
      it 'sets the :visited option to true' do
        by 'running the method' do
          subject
        end

        and_it 'sets options[:active] to true' do
          expect(step.options.keys).to include :visited

          expect(step.options).to include({ active: true, visited: true })
        end
      end
    end

    context 'when :active is falsey in options' do
      let(:options) { { active: false } }
      it 'sets does not set the :visited option to true' do
        by 'running the method' do
          subject
          # raise step.options.inspect
        end

        and_it 'does not add the active key to the options' do
          expect(step.options.keys).not_to include :visited
        end
      end
    end
  end

  describe '#disabled' do
    let(:tested_visited) { nil }
    let(:tested_active) { nil }
    let(:maybe_disabled_option) { {} }
    let(:options) { { **maybe_disabled_option, visited: tested_visited, active: tested_active } }

    subject { step.disabled }

    context 'when :disabled has a .present? value in options' do
      let(:maybe_disabled_option) { { disabled: tested_disabled } }
      let(:tested_disabled) { true }

      it 'returns the value' do
        expect(subject).to eq tested_disabled
      end
    end

    context 'when :disabled has a not .present? value' do
      let(:maybe_disabled_option) { {} }

      context 'when the :visited is true in options' do
        let(:tested_visited) { true }

        context 'and when :active is true in options' do
          let(:tested_active) { true }
          it 'does not set the component to disabled: true' do
            expect(subject).not_to be
          end
        end

        context 'and when :active is false in options' do
          let(:tested_active) { false }
          it 'does not set the component to disabled: true' do
            expect(subject).not_to be
          end
        end
      end

      context 'when the :visited is false in options' do
        let(:tested_visited) { false }
        context 'and when :active is true in options' do
          let(:tested_active) { true }
          it 'does not set the component to disabled: true' do
            expect(subject).not_to be
          end
        end

        # This is the only condition when :disabled is not present
        # that will return a default `true` value
        context 'and when :active is false in options' do
          let(:tested_active) { false }
          it 'sets the component to disabled: true' do
            expect(subject).to be
          end
        end
      end
    end
  end

  describe '#component_family' do
    subject { step.component_family }

    it { is_expected.to eq :steps }
  end

  describe '#step' do
    subject { step.step }

    context 'when :step is present in options' do
      let(:options) { { step: tested_step } }
      let(:tested_step) { 4 }
      it { is_expected.to eq tested_step }
    end

    context 'when :step is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#visited' do
    subject { step.visited }

    context 'when :visited is present in options' do
      let(:options) { { visited: tested_visited } }
      let(:tested_visited) { true }
      it { is_expected.to eq tested_visited }
    end

    context 'when :visited is not present in options' do
      let(:options) { {} }
      it { is_expected.not_to be }
    end
  end

  describe '#render' do
    subject { step.render }
    let(:tested_step) { nil }
    let(:tested_body) { nil }
    let(:tested_icon) { nil }
    let(:tested_href) { nil }
    let(:tested_disabled) { nil }
    let(:options) { { step: tested_step, body: tested_body, icon: tested_icon, href: tested_href, disabled: tested_disabled } }

    it 'renders a basic default component when no options are set' do
      expect(subject).to eq "<li class=\"nav-item disabled\" tabindex=\"-1\"><a class=\"nav-link disabled\" tabindex=\"-1\"><div class=\"step-indicator\"></div><p class=\"mt-1 mb-0 step-text text-muted\"></p></a></li>"
    end

    describe 'the :step option' do
      context 'when step is a number' do
        # verifies that the step is actually rendering -- has to do with capturing content that's not a string.
        let(:tested_step) { 100 }
        it 'successfully renders the component number as a string' do
          expect(subject).to include "<div class=\"step-indicator\">#{tested_step}</div>"
        end
      end

      context 'when step is a string' do
        let(:tested_step) { 'tested string' }
        it 'successfully renders the component number as a string' do
          expect(subject).to include "<div class=\"step-indicator\">#{tested_step}</div>"
        end
      end

      context 'when :icon is present in options' do
        let(:tested_icon) { 'star' }
        let(:tested_step) { 1 }
        it 'overwrites the tested :step value with the icon and renders the icon instead' do
          expect(subject).to include "<div class=\"step-indicator\"><i aria-hidden=\"true\" class=\"fa fa-#{tested_icon}\"></i></div>"

          expect(subject).not_to include "<div class=\"step-indicator\">#{tested_step}</div>"
        end
      end
    end

    describe 'rendering :body' do
      let(:tested_body) { 'tested body' }
      it 'renders the body in the correct place' do
        expect(subject).to include "<p class=\"mt-1 mb-0 step-text text-muted font-size-sm\">#{tested_body}</p>"
      end
    end

    describe 'rendering icon' do
      let(:tested_icon) { 'heart' }
      it 'renders the icon in the step indicator' do
        expect(subject).to include "<div class=\"step-indicator\"><i aria-hidden=\"true\" class=\"fa fa-#{tested_icon}\"></i></div>"
      end
    end

    describe 'a disabled step' do
      let(:tested_disabled) { true }
      it 'renders the disabled step' do
        expect(subject).to eq "<li class=\"nav-item disabled\" tabindex=\"-1\"><a class=\"nav-link disabled\" tabindex=\"-1\"><div class=\"step-indicator\"></div><p class=\"mt-1 mb-0 step-text text-muted\"></p></a></li>"
      end
    end

    describe 'adding a tooltip' do
      let(:tested_tooltip) { 'tested tooltip' }
      let(:tested_active) { nil }
      let(:tested_disabled) { nil }
      let(:options) { { tooltip: tested_tooltip, disabled: tested_disabled, active: tested_active } }

      context 'when the step is disabled' do
        let(:tested_active) { false }
        let(:tested_disabled) { true }

        it 'renders the disabled step with a tooltip'
        pending 'does not yet work'

      end

      context 'when the step is not disabled' do
        let(:tested_active) { true }
        let(:tested_disabled) { false }
        it 'renders the step with a tooltip' do
          expect(subject).to eq "<li class=\"nav-item active visited\" data-toggle=\"tooltip\" data-placement=\"top\" data-html=\"true\" title=\"tested tooltip\"><a class=\"nav-link\"><div class=\"step-indicator\"></div><p class=\"mt-1 mb-0 step-text text-muted\"></p></a></li>"
        end
      end
    end
  end

  describe '#base_element' do
    subject { step.send(:base_element) }
    it { is_expected.to eq :li }
  end

  describe '#css_classes' do
    let(:options) { { visited: tested_visited } }
    subject { step.send(:css_classes) }

    context 'when :visited is true in options' do
      let(:tested_visited) { true }
      it { is_expected.to include 'visited' }
    end

    context 'when :visited is false in options' do
      let(:tested_visited) { false }
      it { is_expected.not_to include 'visited' }
    end
  end

  describe '#non_html_attribute_options' do
    subject { step.send(:non_html_attribute_options) }
    it { is_expected.to include(:visited, :step) }
  end
end
