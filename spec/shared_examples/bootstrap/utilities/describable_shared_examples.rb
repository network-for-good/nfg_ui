shared_examples_for 'a component that includes the Describable utility module' do
  describe 'Describable module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Describable }
    it 'responds to the dismissible public methods' do
      expect(component).to respond_to :describe, :data
    end
  end

  describe 'a describable (rendered) component' do
    let(:component_symbolic_name) { described_class.to_s.split('::').last.underscore.downcase.to_sym }
    let(:view_context) { ActionController::Base.new.view_context }
    let(:ruby_component) { described_class.new(options, ActionController::Base.new.view_context) }
    let(:rendered_component) { view_context.ui.nfg(component_symbolic_name, ruby_component.options) }
    let(:options) { {} }
    let(:arbitrary_data_key) { 'test-key' }
    let(:arbitrary_data_value) { 'test-value' }

    subject { rendered_component }

    context 'when :describe is present in options' do
      let(:tested_describe) { 'tested-describe' }
      context 'when the component has a data attribute already present' do
        let(:options) { { describe: tested_describe, data: { arbitrary_data_key => arbitrary_data_value } } }

        it 'outputs the component with the data-describe in addition to the original data attributes' do
          expect(subject.tr('\"', "'")).to include "data-describe='#{tested_describe}'", "data-#{arbitrary_data_key}='#{arbitrary_data_value}'"
        end
      end

      context 'when a component does not already have a data attribute present' do
        before { ruby_component.options[:data] = {} }
        let(:options) { { describe: tested_describe } }
        it 'adds the data describe to the component' do
          expect(subject.tr('\"', "'")).to include "data-describe='#{tested_describe}'"
        end
      end
    end

    context 'when :describe is not present in options' do
      context 'when the component has a data attribute' do
        let(:options) { { data: { arbitrary_data_key => arbitrary_data_value } } }
        it 'does not interfere with the components data attributes' do
          expect(subject.tr('\"', "'")).to include "data-#{arbitrary_data_key}='#{arbitrary_data_value}'"
          expect(subject).not_to include 'data-describe'
        end
      end

      context 'when a component does not have a data attribute' do
        before { ruby_component.options[:data] = {} }
        it 'does not add an empty data attribute to the component' do
          expect(subject).not_to include 'data-describe'
        end
      end
    end
  end
end
