require 'rails_helper'

RSpec.describe NfgUi::Components::Patterns::Carousel do
  let(:carousel) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:rendered) { carousel.render }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Carousel }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Describable utility module'
  it_behaves_like 'a component that includes the Renderable utility module'

  it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Traitable }


  describe '#render' do
    subject { Capybara.string(rendered) }

    it 'includes a unique padding on the inner carousel' do
      expect(subject).to have_css '.carousel-inner.pb-3'
    end

  end
end
