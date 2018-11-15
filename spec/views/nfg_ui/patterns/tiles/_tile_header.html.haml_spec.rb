require 'rails_helper'

RSpec.describe 'nfg_ui/patterns/tiles/_tile_header.html.haml', type: :view do
  let(:tile_header) { FactoryBot.create(:tile_header, *traits, **options) }
  let(:options) { {} }
  let(:traits) { [] }
  subject { render 'nfg_ui/patterns/tiles/tile_header', tile_header: tile_header }

  pending 'Tile header spec needed'

  it { is_expected.to have_css '.tile-header' }

  describe 'tile header default html output' do
    it 'outputs a default tile header in html' do
    end
  end

  describe 'collapsible tile header' do
    context 'when tile is collapsible' do
      context 'when collapse is present in options' do
        it 'outputs a collapsible tile header' do
        end

        context 'when tile header has an icon in options' do
          it 'outputs a tile header with an icon' do
          end
        end

        context 'when tile header does not have an icon in options' do
          it 'outputs a tile header without an icon' do
          end
        end
      end

      context 'when collapse is not present in options' do
        it 'it outputs a tile header that is not collapsible' do
        end
      end
    end

    context 'when tile is not collapsible' do
      it 'outputs a tile header that is not collapsible' do
      end

      context 'when tile header as an icon in options' do
        it 'outputs a tile header with an icon' do
        end
      end

      context 'when tile header does not have an icon in options' do
        it 'outputs a tile header without an icon' do
        end
      end
    end
  end
end
