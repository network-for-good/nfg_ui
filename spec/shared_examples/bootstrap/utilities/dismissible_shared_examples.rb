shared_examples_for 'a component that includes the Dismissible utility module' do |component_suite:|
  describe 'Dismissible module included in the component' do
    let(:component) { described_class.new(options, ActionController::Base.new.view_context) }
    let(:options) { {} }
    it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::Dismissible }
    it 'responds to the Dismissible public methods' do
      expect(component).to respond_to :dismissible
    end
  end

  describe 'A dismissible (rendered) component' do
    let(:component_symbolic_name) { described_class.to_s.split('::').last.underscore.downcase.to_sym }
    let(:view_context) { ActionController::Base.new.view_context }
    let(:ruby_component) { described_class.new(options, ActionController::Base.new.view_context) }
    let(:rendered_component) { view_context.ui.send(component_suite, component_symbolic_name, ruby_component.options) }
    let(:options) { {} }

    subject { uniform_rendered_component(rendered_component) }

    context 'when dismissible is true' do
      let(:options) { { dismissible: true } }
      it 'includes dismissible keywords in the html' do
        expect(substring_present?(string: subject,
                                  starting_substring: "class='",
                                  ending_substring: "'",
                                  sought_substring: %w[dismissible show fade])).to be
      end
    end

    context 'when dismissible is false' do
      let(:options) { { dismissible: false } }
      it 'does not include dismissible keywords in the html' do
        expect(substring_present?(string: subject,
                                  starting_substring: "class='",
                                  ending_substring: "'",
                                  sought_substring: %w[dismissible show fade])).not_to be
      end
    end
  end
end
