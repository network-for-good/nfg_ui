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

  describe '#auto' do
    let(:tested_option) { :auto }
    subject { carousel.auto }
    it_behaves_like 'a fetched option with a defined fallback', fallback: true
  end

  describe '#data' do
    subject { carousel.data }
    let(:example_data) { {} }
    let(:tested_auto) { nil }
    let(:options) { { auto: tested_auto, data: example_data } }

    context 'when :auto is false' do
      let(:tested_auto) { false }
      context 'when data has additional options present in the hash' do
        let(:example_data) { { test: :example } }
        it 'sets interval to false and merges in the sample data hash' do
          expect(subject).to eq({ interval: 'false', **example_data })
        end
      end

      context 'when data does not have additional options present in the hash' do
        let(:example_data) { {} }
        it 'sets interval to false and merges in the sample data hash' do
          expect(subject).to eq({ interval: 'false' })
        end
      end
    end

    context 'when :auto is not false' do
      let(:auto) { nil }
      context 'when data has additional options present in the hash' do
        let(:example_data) { { test: :example } }
        it 'sets the data-ride to carousel and merges in the sample data hash' do
          expect(subject).to eq({ ride: 'carousel', **example_data })
        end
      end

      context 'when data does not have additional options present in the hash' do
        let(:example_data) { {} }
        it 'sets the data-ride to carousel' do
          expect(subject).to eq({ ride: 'carousel' })
        end
      end
    end
  end

  describe '#render' do
    subject { Capybara.string(rendered) }

    context 'when indicators are present' do
      let(:options) { { indicators: 3 } }
      it 'includes a unique padding on the inner carousel that is designed to facilitate a text-based carousel like a donor scroll instead of a hero banner image-based carousel' do
        expect(subject).to have_css 'ol.carousel-indicators li', count: 3
      end
    end

    context 'and when indicators are 0' do
      let(:options) { { indicators: 0 } }
      it 'does not include indicators' do
        expect(subject).not_to have_css '.carousel-indicators'
      end
    end

    context 'and when indicators are nil' do
      let(:options) { { indicators: nil } }
      it 'does not include indicators' do
        expect(subject).not_to have_css '.carousel-indicators'
      end
    end
  end
end
