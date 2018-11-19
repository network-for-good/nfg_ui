shared_examples_for 'a component that includes the Renderable utility module' do
  describe 'Renderable module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Renderable }
    it 'responds to the Renderable public methods' do
      expect(component).to respond_to :render_if, :render_unless
    end
  end

  describe 'A renderable (rendered) component' do
    let(:component_symbolic_name) { described_class.to_s.split('::').last.underscore.downcase.to_sym }
    let(:view_context) { ActionController::Base.new.view_context }
    let(:ruby_component) { described_class.new(options.merge(secondary_options), ActionController::Base.new.view_context) }
    let(:rendered_component) { view_context.ui.nfg(component_symbolic_name, ruby_component.options) }
    let(:options) { {} }
    let(:secondary_options) { { body: 'must be here for components that only output a body without html' } }

    subject { rendered_component }

    describe 'render_if' do
      context 'when render_if is true' do
        let(:options) { { render_if: true } }
        it 'renders the component' do
          expect(subject).to be_present
        end
      end

      context 'when render_if is false' do
        let(:options) { { render_if: false } }
        it 'renders the component' do
          expect(subject).not_to be_present
        end
      end

      context 'when render_if is not present' do
        let(:options) { {} }
        it 'renders the component' do
          expect(subject).to be_present
        end
      end

      context 'when render_if is nil' do
        let(:options) { { render_if: nil } }
        it 'renders the component' do
          expect(subject).not_to be_present
        end
      end
    end

    describe 'render_unless' do
      let(:options) { { render_unless: unless_conditon } }
      let(:unless_conditon) { nil }
      context 'when render_unless is true' do
        let(:unless_conditon) { 1==1 } # show how render_unless actually works
        let(:options) { { render_unless: unless_conditon } }
        it 'does not render the component (render_unless is the opposite of render_if)' do
          expect(subject).not_to be_present
        end
      end

      context 'when render_unless is false' do
        let(:unless_conditon) { 1!=1 }
        let(:options) { { render_unless: unless_conditon } }
        it 'renders the component (render_unless is the opposite of render_if)' do
          expect(subject).to be_present
        end
      end

      context 'when render_unless is not present' do
        let(:options) { {} }
        it 'renders the component' do
          expect(subject).to be_present
        end
      end

      context 'when render_unless is nil' do
        let(:unless_conditon) { nil }
        it 'renders the component' do
          expect(subject).to be_present
        end
      end
    end
  end
end
