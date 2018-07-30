require 'rails_helper'

RSpec.describe NfgUi do
  describe 'Registered themes & components for Bootstrap 4' do
    describe 'Registered Bootstrap 4 themes' do
      it 'contains the approved list of themes as of Bootstrap 4.1' do
        expect(NfgUi::BOOTSTRAP_THEMES).to eq %i[primary
                                                 secondary
                                                 success
                                                 danger
                                                 warning
                                                 info
                                                 light
                                                 dark]
      end
    end

    describe 'Registered Bootstrap 4 components' do
      it 'contains the approved list of components as of Bootstrap 4.1' do
        expect(NfgUi::BOOTSTRAP_COMPONENT_NAMES).to eq %i[alert
                                                          badge
                                                          breadcrumb
                                                          breadcrumb_item
                                                          button
                                                          button_group
                                                          button_toolbar
                                                          card
                                                          carousel
                                                          dropdown
                                                          embed
                                                          form
                                                          input_group
                                                          jumbotron
                                                          list_group
                                                          list_group_item
                                                          media_object
                                                          modal
                                                          nav
                                                          navbar
                                                          pagination
                                                          popover
                                                          progress
                                                          table]
      end
    end

    describe 'Registered component names for the Network for Good design system' do
      describe 'grouping names' do
        it 'contains the correct component grouping names' do
          expect(NfgUi::GROUPING_NAMES).to eq %i[foundations
                                                 elements
                                                 patterns]
        end
      end

      describe 'foundation component names' do
        it 'contains the approved list of foundation component names' do
          expect(NfgUi::FOUNDATION_COMPONENT_NAMES).to eq %i[color
                                                             icon
                                                             image
                                                             input
                                                             grid
                                                             typeface]
        end
      end

      describe 'element component names' do
        it 'contains the approved list of element component names' do
          expect(NfgUi::ELEMENT_COMPONENT_NAMES).to eq %i[activity
                                                          alert
                                                          badge
                                                          breadcrumb
                                                          breadcrumb_item
                                                          button
                                                          chart
                                                          dropdown
                                                          embed
                                                          form_control
                                                          input_group
                                                          key
                                                          list_group_item
                                                          loader
                                                          media_object
                                                          nav
                                                          popover
                                                          progress_bar
                                                          slat
                                                          stat
                                                          table
                                                          task]
        end
      end

      describe 'pattern component names' do
        it 'contains the approved list of pattern component names' do
          expect(NfgUi::PATTERN_COMPONENT_NAMES).to eq %i[activity_feed
                                                          button_group
                                                          button_toolbar
                                                          card
                                                          carousel
                                                          collapse
                                                          empty_state
                                                          filter_bar
                                                          form_group
                                                          graph
                                                          jumbotron
                                                          list_group
                                                          media_group
                                                          modal
                                                          navbar
                                                          page_header
                                                          slat_list
                                                          task_list
                                                          tile
                                                          tile_body
                                                          tile_header
                                                          tile_section]
        end
      end
    end
  end
end