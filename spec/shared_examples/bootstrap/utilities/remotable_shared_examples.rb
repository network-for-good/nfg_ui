shared_examples_for 'a component that includes the Remotable utility module' do |component_suite:, skip_include_check: false|
  describe 'Remotable module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }

    # In some rare instances, e.g. on DropdownItem, we are conditionally extending this module
    # AFTER initialize; as such, it won't show up.
    unless skip_include_check
      it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::Remotable }
    end
    it 'responds to the public methods' do
      expect(component).to respond_to :remote
    end
  end

  describe 'a remotable (rendered) component' do
    let(:component_symbolic_name) { described_class.to_s.split('::').last.underscore.downcase.to_sym }
    let(:view_context) { ActionController::Base.new.view_context }
    let(:ruby_component) { described_class.new(options, ActionController::Base.new.view_context) }
    let(:rendered_component) { view_context.ui.send(component_suite, component_symbolic_name, ruby_component.options) }
    let(:options) { {} }
    let(:data) { {} }
    let(:tested_data_key) { 'tested-key' }
    let(:tested_data_value) { 'tested-value' }

    subject { uniform_rendered_component(rendered_component) }

    context 'when :remote is true for the component' do
      let(:options) { { remote: true, data: data } }
      context 'and when the component has additional data attributes' do
        let(:data) { { tested_data_key => tested_data_value } }
        it 'adds the remotable data attribute to the existing data attributes' do
          by 'keeping the existing data attributes' do
            expect(subject).to include "data-#{tested_data_key}='#{tested_data_value}'"
          end

          and_by 'adding the new remotable data attribute' do
            expect(subject).to include "data-remote='true'"
          end
        end
      end

      context 'and when the component does not have additional data attributes' do
        let(:data) { {} }
        it 'adds the remotable data attribute to the component' do
          and_by 'adding the new remotable data attribute' do
            expect(subject).to include "data-remote='true'"
          end
        end
      end
    end

    context 'when :remote is false for the component' do
      let(:options) { { remote: false, data: data } }
      context 'and when the component has existing data attributes' do
        let(:data) { { tested_data_key => tested_data_value } }
        it 'does not add the remotable data attribute' do
          by 'keeping the existing data attributes' do
            expect(subject).to include "data-#{tested_data_key}='#{tested_data_value}'"
          end

          and_by 'not adding the remotable data attribute' do
            expect(subject).not_to include "data-remote='true'"
          end
        end
      end

      context 'and when the component does not have existing data attributes' do
        it 'does not add the remotable data attributes' do
          expect(subject).not_to include "data-remote='true'"
        end
      end
    end
  end
end
