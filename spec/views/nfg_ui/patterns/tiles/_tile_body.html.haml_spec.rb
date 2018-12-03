require 'rails_helper'

RSpec.describe 'nfg_ui/patterns/tiles/_tile_body.html.haml', type: :view do
  let(:tile_body) { FactoryBot.create(:tile_body, *traits, **options) }
  let(:options) { {} }
  let(:traits) { [] }
  subject { tile_body.render }

  pending 'Tile body spec needed'

  it { is_expected.to have_css '.tile-body' }

  describe 'tile body default html output' do
    it 'outputs a default tile body in html' do
    end
  end

  describe 'tile body headings' do
    context 'when tile body has a heading in options' do
      it 'outputs a tile heading within the tile body' do
      end

      describe 'tile body heading icons' do
        context 'and when a tile body has an icon in options' do
          it 'outputs a tile body heading with an icon' do
          end
        end

        context 'and when a tile body does not have an icon in options' do
          it 'outputs a tile body heading without an icon' do
          end
        end
      end
    end

    context 'when tile body does not have a heading in options' do
      it 'outputs a tile body without a tile heading' do
      end
    end
  end
end
