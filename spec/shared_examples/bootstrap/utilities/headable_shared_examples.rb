shared_examples_for 'a component that includes the Headable utility module' do |component_suite:|
  describe 'Headable module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::Headable }
    it 'responds to the dismissible public methods' do
      expect(component).to respond_to :heading
    end
  end

  describe 'A headable (rendered) component' do
    let(:component_symbolic_name) { described_class.to_s.split('::').last.downcase.to_sym }
    let(:view_context) { ActionController::Base.new.view_context }
    let(:component) { NfgUi::UI::Base.new(view_context).send(component_suite, component_symbolic_name, options) }
    let(:options) { {} }
    let(:tested_heading) { 'Tested heading' }
    subject { component }

    # It's not possible to test for heading not being present in a shared example
    # because it's not possible to know what the heading element is that indicates the 
    # heading would be present but isn't.
    #
    # Individual components will need to test heading presence & impact from an HTML standpoint
    context 'when heading is present in options' do
      let(:options) { { heading: tested_heading } }
      it { is_expected.to include tested_heading }
    end
  end
end
