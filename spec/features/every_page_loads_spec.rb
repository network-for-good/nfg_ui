require 'rails_helper'

RSpec.describe 'Every page loads, quick sanity check', type: :feature, js: true do
  describe 'no pages throw an error' do
    it 'visits every bootstrap page' do
      NfgUi::BOOTSTRAP_COMPONENT_NAMES.each do |component|
        visit root_path
        find('a#bootstrap').click
        find("[aria-labelledby='bootstrap'] [data-describe='#{component}']").click

        if component_redirected?(component, :bootstrap)
          expect(page).to have_css "body.bootstrap.#{parent_component(component, :bootstrap).to_s.pluralize}.index"
        else
          expect(page).to have_css "body.bootstrap.#{component.to_s.pluralize}.index"
        end
      end
    end

    it 'visits every foundation page' do
      NfgUi::FOUNDATION_COMPONENT_NAMES.each do |component|
        visit root_path
        find('a#foundation').click
        find("[aria-labelledby='foundation'] [data-describe='#{component}']").click

        if component_redirected?(component, :nfg)
          expect(page).to have_css "body.foundations.#{parent_component(component, :nfg).to_s.pluralize}.index"
        else
          expect(page).to have_css "body.foundations.#{component.to_s.pluralize}.index"
        end
      end
    end

    it 'visits every element page' do
      NfgUi::ELEMENT_COMPONENT_NAMES.each do |component|
        visit root_path
        find('a#element.dropdown-toggle').click
        find("[aria-labelledby='element'] [data-describe='#{component}']").click

        if component_redirected?(component, :nfg)
          expect(page).to have_css "body.elements.#{parent_component(component, :nfg).to_s.pluralize}.index"
        else
          expect(page).to have_css "body.elements.#{component.to_s.pluralize}.index"
        end
      end
    end

    it 'visits every pattern page' do
      NfgUi::PATTERN_COMPONENT_NAMES.each do |component|
        visit root_path
        find('a#pattern.dropdown-toggle').click
        find("[aria-labelledby='pattern'] [data-describe='#{component}']").click

        if component_redirected?(component, :nfg)
          expect(page).to have_css "body.patterns.#{parent_component(component, :nfg).to_s.pluralize}.index"
        else
          expect(page).to have_css "body.patterns.#{component.to_s.pluralize}.index"
        end
      end
    end
  end
end

def bootstrap_component_parents
  [
    { child: :breadcrumb_item, parent: :breadcrumb },
    { child: :list_group_item, parent: :list_group }
  ]
end

def nfg_component_parents
  [
    { child: :breadcrumb_item, parent: :breadcrumb },
    { child: :tile_body, parent: :tile },
    { child: :tile_header, parent: :tile },
    { child: :tile_section, parent: :tile },
  ]
end

def parent_component(component, suite)
  parents = suite == :bootstrap ? bootstrap_component_parents : nfg_component_parents
  parent_component_hash =
    parents.find do |component_array|
      next unless component_array[:child] == component
      component_array
    end

  parent_component_hash[:parent]
end

def component_redirected?(component, suite)
  parents = suite == :bootstrap ? bootstrap_component_parents : nfg_component_parents
  parents.map { |a| a[:child] }.include?(component)
end
