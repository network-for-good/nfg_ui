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
    let(:component_symbolic_name) { described_class.to_s.split('::').last.downcase.to_sym }
    let(:view_context) { ActionController::Base.new.view_context }
    let(:component) { NfgUi::UI::Base.new(view_context).send(component_suite, component_symbolic_name, options) }
    let(:options) { {} }

    subject { component }

    context 'when dismissible is true' do
      let(:options) { { dismissible: true } }
      it 'includes dismissible keywords in the html' do
        expect(substring_present?(string: subject.tr("\"", "'"),
                                  starting_substring: "class='",
                                  ending_substring: "'",
                                  sought_substring: %w[dismissible show fade])).to be
      end
    end

    context 'when dismissible is false' do
      let(:options) { { dismissible: false } }
      it 'does not include dismissible keywords in the html' do
        expect(substring_present?(string: subject.tr("\"", "'"),
                                  starting_substring: "class='",
                                  ending_substring: "'",
                                  sought_substring: %w[dismissible show fade])).not_to be
      end
    end
  end
end
