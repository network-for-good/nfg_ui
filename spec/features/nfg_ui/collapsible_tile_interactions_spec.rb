require 'rails_helper'

RSpec.describe 'Collapsible tile interactions', js: true do
  before { visit tile_feature_spec_views_path }

  it 'shows the collapse icon in the correct up/down orientation' do
    and_it 'shows the collapse icon in the collapse orientation when the tile is expanded' do
      # indicates it's not collapsed
      expect(page).to have_css "#collapse_tile.collapse.show"

      # shows correct data attributes and has correct icon
      expect(page).to have_css ".tile-header [data-toggle='collapse'][data-collapse-icon='caret-up'][data-collapsed-icon='caret-down'] .fa-caret-up"
    end

    and_by 'clicking the toggle' do
      page.find("a[data-toggle='collapse']").click
      sleep 1
    end

    and_it 'collapses the tile' do
      # sanity check, the div is hidden visually
      expect(page).to have_css "#collapse_tile.collapse", visible: false

      # .show is removed to collapse the component
      expect(page).not_to have_css "#collapse_tile.collapse.show"
    end

    and_it 'swaps the component' do
      expect(page).not_to have_css ".tile-header [data-toggle='collapse'] .fa-caret-up"
      expect(page).to have_css ".tile-header [data-toggle='collapse'] .fa-caret-down"
    end
  end
end