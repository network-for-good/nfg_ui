require 'rails_helper'

RSpec.describe NfgUi::Components::Traits::Button do
  let(:component_with_traits) { NfgUi::Components::Elements::Button.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  describe 'registered traits' do
    subject { described_class::TRAITS }
    it { is_expected.to eq %i[block close link outlined remote submit] }
  end

  describe '#link_trait' do
    subject { component_with_traits.link_trait }

    context 'when a color is supplied to the link button' do
      let(:options) { { traits: [:link, :danger] } }
      subject { component_with_traits.render }
      it 'utilizes both the theme for link and the theme for the color supplied' do
        expect(subject).to eq  "<a class=\"btn text-danger btn-link\" href=\"#\"></a>"
      end
    end

    context 'when a color is not supplied to the link button' do
      let(:options) { { traits: [:link] } }
      subject { component_with_traits.render }

      it 'sets the button to a link and does not supply a color' do
        expect(subject).to eq "<a class=\"btn btn-link\" href=\"#\"></a>"
      end
    end
  end
end