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

    context 'when indicators are present' do
      let(:options) { { indicators: 3 } }
      it 'includes a unique padding on the inner carousel that is designed to facilitate a text-based carousel like a donor scroll instead of a hero banner image-based carousel' do
        expect(subject).to have_css '.carousel-inner.pb-3'
      end
    end

    context 'and when indicators are 0' do
      let(:options) { { indicators: 0 } }
      it 'does not include pb-3' do
        expect(subject).not_to have_css '.carousel-inner.pb-3'
        expect(subject).to have_css '.carousel-inner'
      end
    end

    context 'and when indicators are nil' do
      let(:options) { { indicators: nil } }
      it 'does not include pb-3' do
        expect(subject).not_to have_css '.carousel-inner.pb-3'
        expect(subject).to have_css '.carousel-inner'
      end
    end
  end

  describe '#carousel_inner_css_classes' do
    subject { carousel.send(:carousel_inner_css_classes) }

    context 'when indicators in options are greater than 0' do
      let(:options) { { indicators: 1 } }
      it { is_expected.to eq 'carousel-inner pb-3' }
    end

    context 'when indicators in options is 0'
    let(:options) { { indicators: 0 } }
    it { is_expected.not_to include 'pb-3' }
    it { is_expected.to eq 'carousel-inner' }
  end
end
