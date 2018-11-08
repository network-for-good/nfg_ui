# frozen_string_literal: true

shared_examples_for 'a component that includes the Themeable utility module' do |component_suite:|
  describe 'Themeable module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::Themeable }
    it 'responds to the Themeable public methods' do
      expect(component).to respond_to :outlined, :theme
    end
  end

  describe 'a themeable (rendered) component' do
    let(:component_symbolic_name) { described_class.to_s.split('::').last.underscore.downcase.to_sym }
    let(:view_context) { ActionController::Base.new.view_context }
    let(:ruby_component) { described_class.new(options, ActionController::Base.new.view_context) }
    let(:rendered_component) { view_context.ui.send(component_suite, component_symbolic_name, ruby_component.options) }
    let(:options) { {} }
    let(:tested_heading) { 'Tested heading' }

    subject { rendered_component }

    context 'when a theme is present in options' do
      context 'when outlined is present in options' do
        let(:options) { { outlined: true, theme: @theme } }
        NfgUi::BOOTSTRAP_THEMES.each do |theme|
          it 'applies a theme that is outlined' do
            @theme = theme
            if ruby_component.send(:outlineable?)
              expect(subject).to include "#{ruby_component.send(:theme_css_class_prefix)}#{ruby_component.send(:outlined_css_class_prefix)}#{theme}"
            else
              expect(subject).not_to include "#{ruby_component.send(:theme_css_class_prefix)}#{ruby_component.send(:outlined_css_class_prefix)}#{theme}"
              expect(subject).to include "#{ruby_component.send(:theme_css_class_prefix)}#{theme}"
            end
          end
        end
      end

      context 'when outlined is false in options' do
        let(:options) { { outlined: false, theme: @theme } }
        it_behaves_like 'a component without outlined themes'
      end

      context 'when outlined is nil in options' do
        let(:options) { { outlined: nil, theme: @theme } }
        it_behaves_like 'a component without outlined themes'
      end

      context 'when outlined is not present in options' do
        let(:options) { { theme: @theme } }
        it_behaves_like 'a component without outlined themes'
      end
    end

    context 'when theme is not present in options' do
      let(:component_default_theme) { ruby_component.send(:default_theme) }
      let(:default_theme) { Class.new.include(NfgUi::Bootstrap::Utilities::Themeable).new.send(:default_theme) }
      context 'when a default theme is established in the component' do
        
        it 'renders the component with the alternative default theme' do
          unless component_default_theme.nil?
            expect(subject).to include "#{ruby_component.send(:theme_css_class_prefix)}#{component_default_theme}"
          end
        end
      end

      context 'when the default theme is set to nil in the component' do
        it 'renders the component with no theme' do
          if component_default_theme.nil?
            expect(subject).not_to include "#{ruby_component.send(:theme_css_class_prefix)}#{default_theme}"
          end
        end
      end

      context 'when a default theme is not established in the component' do
        it 'renders the component with the themeable default theme' do
          unless component_default_theme.nil?
            expect(subject).to include "#{ruby_component.send(:theme_css_class_prefix)}#{component_default_theme}"
          end
        end
      end

      context 'when theme is set to nil' do
        let(:options) { { theme: nil } }

        it 'renders the component with no themes' do
          expect(subject).to include "#{ruby_component.send(:component_css_class)}"
          expect(subject).not_to include "#{ruby_component.send(:theme_css_class_prefix)}#{component_default_theme}"
        end

        context 'and when a theme is present in options' do
          let(:tested_theme) { NfgUi::BOOTSTRAP_THEMES.sample(1).first }
          let(:options) { { theme: tested_theme } }
          it 'renders the component with a theme' do
            expect(subject).to include "#{ruby_component.send(:theme_css_class_prefix)}#{tested_theme}"
          end
        end
      end
    end
  end
end

shared_examples_for 'a component without outlined themes' do
  NfgUi::BOOTSTRAP_THEMES.each do |theme|
    it 'applies a theme that is not outlined' do
      @theme = theme
      expect(rendered_component).not_to include "#{ruby_component.send(:theme_css_class_prefix)}#{ruby_component.send(:outlined_css_class_prefix)}#{theme}"
      expect(rendered_component).to include "#{ruby_component.send(:theme_css_class_prefix)}#{theme}"
    end
  end
end
