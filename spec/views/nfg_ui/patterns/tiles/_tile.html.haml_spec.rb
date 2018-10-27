require 'rails_helper'

RSpec.describe 'nfg_ui/foundations/tiles/_tile.html.haml', type: :view do
  let(:tile) { FactoryBot.create(:tile, *traits, **options) }
  let(:options) { {} }
  let(:traits) { [] }
  subject { render 'nfg_ui/foundations/tiles/tile', tile: tile }

  pending 'Tile spec needed'

  describe 'the tile output html' do
    it 'outputs the tile html' do
    end
  end

  describe 'the tile header' do
    context 'when title is present in the tile options' do
      it 'outputs the tile title in a tile_header component' do
      end

      context 'and when the tile is collapsible' do
        it 'outputs the collapsible tile header with the title' do
        end
      end

      context 'and when the tile is not collapsible' do
        it 'does not output a collapsible version of the tile header'
      end
    end

    context 'when tile is not present in the tile options' do
      it 'does not output the tile header' do
      end
    end
  end

  describe 'the tile body' do
    context 'when the tile is collapsible' do
      it 'outputs the tile body within a collapse component' do
      end

      context 'and when the tile is collapsed' do
        it 'outputs a hidden / collapsed tile body' do
        end
      end

      context 'and when the tile is not collapsed' do
        it 'outputs a shown tile body' do
        end
      end
    end

    context 'when the tile is not collapsible' do
      it 'outputs a tile body without a collapse wrapping component' do
      end
    end
  end
end
