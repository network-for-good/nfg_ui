require 'rails_helper'

RSpec.describe NfgUi::Components::Patterns::Collapse do
  let(:collapse) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Collapse }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Describable utility module'
  it_behaves_like 'a component that includes the Headable utility module', component_suite: :nfg
  it_behaves_like 'a component that includes the Renderable utility module'

  it_behaves_like 'a component that includes the Collapse trait module'

  it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Traitable }

  describe '#component_initialize' do
    let(:test_id) { nil }
    let(:test_heading) { nil }
    let(:options) { { id: test_id, heading: test_heading } }

    context 'when heading is not present in options' do
      let(:test_heading) { nil }

      context 'when an ID is not present' do
        let(:test_id) { nil }

        it 'does not generate an ID' do
          expect(collapse.options[:id]).to be_nil
        end
      end

      context 'when an ID is present' do
        let(:test_id) { 'test-id' }

        it 'does uses the options :ID' do
          expect(collapse.options[:id]).to eq test_id
        end
      end
    end

    context 'when heading is present in options' do
      let(:test_heading) { 'test heading' }

      context 'when options includes an :id' do
        let(:test_id) { 'test-id' }
        it 'passes the id in options into the component' do
          expect(collapse.options[:id]).to eq test_id
        end
      end

      context 'when options does not include an :id' do
        let(:test_id) { nil }
        it 'supplies an :id' do
          # it's a random set of letters so we can't really test the exact value
          # but checking that ID is present when it's set to nil
          # is good enough.
          expect(Capybara.string(collapse.render)).to have_css "[id]"
          expect(collapse.options[:id]).to be_present
        end
      end
    end
  end

  describe '#render' do
    let(:options) { { heading: test_heading, id: test_id } }
    let(:test_heading) { nil }
    let(:test_id) { nil }
    let(:capybara_component) { Capybara.string(collapse.render) }

    context 'when a :heading is supplied' do
      let(:test_heading) { 'Test heading' }

      context 'when an ID is not supplied' do
        let(:test_id) { nil }

        it 'renders a button and the collapse icon and a random ID' do
          random_id = capybara_component.find('a')['aria-controls']
          expect(capybara_component).to have_css "a[href='##{random_id}'] + .collapse##{random_id}"
        end
      end
      context 'when an ID is supplied' do
        let(:test_id) { 'test-id' }
        it 'renders the combined components with the supplied :id' do
          expect(capybara_component).to have_css "a[href='##{test_id}'] + .collapse##{test_id}"
        end
      end
    end

    context 'when a heading is not supplied' do
      let(:test_heading) { nil }
      it 'renders only the expected collapse component without a button' do
        expect(collapse.render).to eq "<div class=\"collapse show\"></div>"
      end
    end
  end
end
