require 'rails_helper'

RSpec.describe 'nfg_ui/patterns/tiles/_tile_section.html.haml', type: :view do
  let(:tile_section) { FactoryBot.create(:tile_section, *traits, **options) }
  let(:options) { {} }
  let(:traits) { [] }
  subject { render 'nfg_ui/patterns/tiles/tile_section', tile_section: tile_section }

  pending 'Tile section spec needed'

  it { is_expected.to have_css '.tile-section' }

  describe 'tile section default html output' do
    it 'outputs a default tile section in html' do
    end
  end

  describe 'tile section headings' do
    context 'when tile section has a heading in options' do
      it 'outputs a tile heading within the tile section' do
      end

      describe 'tile section heading icons' do
        context 'when a tile section has an icon in options' do
          it 'outputs a tile section heading with an icon' do
          end
        end

        context 'and when a tile section does not have an icon in options' do
          it 'outputs a tile section heading without an icon' do
          end
        end
      end
    end

    context 'when tile section does not have a heading in options' do
      it 'outputs a tile section without a tile heading' do
      end
    end
  end
end
