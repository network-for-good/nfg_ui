# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Tile doc coming soon
      class Tile < NfgUi::Components::Base
        require 'nfg_ui/bootstrap/utilities/collapsible'
        require_relative '../utilities/requireable'
        require_relative '../utilities/iconable'

        include Bootstrap::Utilities::Collapsible
        include NfgUi::Components::Utilities::Titleable
        include NfgUi::Components::Utilities::Requireable
        include NfgUi::Components::Utilities::Iconable

        attr_accessor :section, :sections

        def initialize(*)
          super
          self.section = options.fetch(:section, default_section)
          self.sections = options.fetch(:sections, default_sections)

          section_error if section && sections
        end

        # Optionally auto-load a footer by passing it in
        # ex: = ui.nfg :tile, body: 'Example', footer: 'Example footer'
        def footer
          options[:footer].presence
        end

        def tile_section?
          section.present? || sections.any?
        end

        def collapsible_body_id
          collapsible_target_id
        end

        private

        def section_error
          raise ArgumentError.new "You attempted to pass in both :sections and :section.
                                   You may only pass in an array of :sections or
                                   a single :section, not both".squish
        end

        def css_classes
          super + ' mt-3'
        end

        def default_collapsible
          false
        end

        def collapsible_target_id
          collapsible? ? "target_collapsible_id_for_#{id}" : ''
        end

        def required
          title ? [:id] : []
        end

        def defaults
          super.merge!(section: (default_section if section.present?),
                       sections: (default_sections if sections.present?))
        end

        def default_section
          ''
        end

        def default_sections
          []
        end

        def component_family
          :tile
        end

        def non_html_attribute_options
          super.push((:footer if footer),
                     *sections_html_attributes).reject(&:nil?)
        end

        def sections_html_attributes
          [(:section if section), (:sections if sections)]
        end
      end
    end
  end
end
