# frozen_string_literal: true

shared_examples_for 'a component that includes the Responsiveable utility module' do |component_suite:|
  let(:component) { described_class.new(options, ActionController::Base.new.view_context) }

  describe 'Responsiveable module included in the component' do
    let(:options) { {} }
    it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::Responsiveable }
    it 'responds to the Responsiveable public methods' do
      expect(component).to respond_to :responsive
    end
  end

  describe 'a rendered responsive component' do
    let(:options) { { responsive: tested_responsive } }
    let(:tested_responsive) { nil }
    let(:rendered_component) { component.render }
    subject { Capybara.string(rendered_component) }

    context 'when :responsive is true in :options' do
      let(:tested_responsive) { true }
      it 'renders the component with the responsive css class' do
        expect(subject).to have_css ".#{component.send(:component_css_class)}-responsive"
      end
    end

    context 'when :responsive is false in :options' do
      let(:tested_responsive) { false }
      it 'does not render the component with the responsive css class' do
        expect(subject).not_to have_css ".#{component.send(:component_css_class)}-responsive"
      end
    end

    context 'when :responsive is truthy in :options' do
      let(:tested_responsive) { 'truthy string' }
      it 'renders the component with the responsive css class' do
        expect(subject).to have_css ".#{component.send(:component_css_class)}-responsive"
      end
    end

    context 'when :responsive is falsey in :options' do
      let(:tested_responsive) { nil }
      it 'does not render the component with the responsive css class' do
        expect(subject).not_to have_css ".#{component.send(:component_css_class)}-responsive"
      end
    end
  end
end