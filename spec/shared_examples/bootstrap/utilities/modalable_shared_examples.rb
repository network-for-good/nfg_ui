shared_examples_for 'a component that includes the Modalable utility module' do |component_suite:|
  describe 'Modalable module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::Modalable }
    it 'responds to the dismissible public methods' do
      expect(component).to respond_to :active
    end
  end

  describe 'a Modalable (rendered) component' do
    let(:component_symbolic_name) { described_class.to_s.split('::').last.underscore.downcase.to_sym }
    let(:view_context) { ActionController::Base.new.view_context }
    let(:ruby_component) { described_class.new(options, ActionController::Base.new.view_context) }
    let(:rendered_component) { ruby_component.render }
    let(:options) { {} }

    subject { Capybara.string(rendered_component) }

    context 'when :modal is present in options' do
      let(:modal_target) { '#target_modal' }
      let(:options) { { modal: modal_target } }
      it 'includes the modal data attributes' do
        expect(subject).to have_css "[data-toggle='modal'][data-target='#{modal_target}']"
      end

      describe ':modal and data attributes' do
        context 'and when data is present in options' do
          let(:test_key) { :test_key }
          let(:test_value) { 'test_value' }
          let(:data_attributes) { { test_key => test_value } }
          let(:options) { { modal: modal_target, data: data_attributes } }
          it 'renders the component with the originally supplied data attributes in addition to the modal data attributes' do
            expect(subject).to have_css "[data-toggle='modal'][data-target='#{modal_target}'][data-#{test_key.to_s.tr('_', '-')}='#{test_value}']"
          end
        end

        context 'and when data is not present in options' do
          subject { uniform_rendered_component(rendered_component) }
          let(:options) { { modal: modal_target } }
          it 'only includes the modal data attributes' do
            expect(subject).to include "data-toggle='modal' data-target='#target_modal'"
            expect(subject.scan(/(?=data)/).count).to eq 2
            # expect(substring_present?(string: subject, starting_substring: "class='", ending_substring: "'", sought_substring: 'active')).not_to be
          end
        end
      end
      
      context 'and when modal is not present in options' do
        let(:options) { {} }
        it 'does not render the component with the _modal_ data attributes' do
          expect(subject).not_to have_css "[data-toggle='modal'][data-target]"
        end
      end

      context 'and when modal is nil in options' do
        let(:options) { { active: nil } }
        it 'does not render the component with the _modal_ data attributes' do
          expect(subject).not_to have_css "[data-toggle='modal'][data-target]"
        end
      end
    end
  end
end
