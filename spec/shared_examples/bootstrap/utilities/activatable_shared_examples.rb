shared_examples_for 'a component that includes the Activatable utility module' do |component_suite:|
  describe 'Activatable module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::Activatable }
    it 'responds to the dismissible public methods' do
      expect(component).to respond_to :active
    end
  end

  describe 'an activatable (rendered) component' do
    let(:component_symbolic_name) { described_class.to_s.split('::').last.underscore.downcase.to_sym }
    let(:view_context) { ActionController::Base.new.view_context }
    let(:ruby_component) { described_class.new(options, ActionController::Base.new.view_context) }
    let(:rendered_component) { view_context.ui.send(component_suite, component_symbolic_name, ruby_component.options) }
    let(:options) { {} }

    subject { uniform_rendered_component(rendered_component) }

    context 'when active is present in options' do
      context 'and when active is true in options' do
        let(:options) { { active: true } }
        it 'renders the component with the _active_ css class' do
          expect(substring_present?(string: subject, starting_substring: "class='", ending_substring: "'", sought_substring: 'active')).to be
        end
      end

      context 'and when active is false in options' do
        let(:options) { { active: false } }
        it 'does not render the component with the _active_ css class' do
          expect(substring_present?(string: subject, starting_substring: "class='", ending_substring: "'", sought_substring: 'active')).not_to be
        end
      end

      context 'and when active is not present in options' do
        let(:options) { {} }
        it 'does not render the component with the _active_ css class' do
          expect(substring_present?(string: subject, starting_substring: "class='", ending_substring: "'", sought_substring: 'active')).not_to be
        end
      end

      context 'and when active is nil in options' do
        let(:options) { { active: nil } }
        it 'does not render the component with the _active_ css class' do
          expect(substring_present?(string: subject, starting_substring: "class='", ending_substring: "'", sought_substring: 'active')).not_to be
        end
      end
    end
  end
end
