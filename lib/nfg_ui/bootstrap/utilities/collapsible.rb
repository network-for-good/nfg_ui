# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows components to have a collapsed state when appropriate
      module Collapsible
        include Bootstrap::Utilities::AriaAssistable
        include NfgUi::Components::Utilities::Requireable
        attr_accessor :collapsed, :collapsible_target_id

        def initialize(*)
          super
          self.collapsed = options.fetch(:collapsed, nil)
          self.collapsible_target_id = collapsible_target_id unless collapsible_target_id.nil? && collapsible?
          collapsible_target_id_error if collapsible_target_id.nil?
        end

        def collapsible?
          (traits & collapsible_traits).present? || collapsed
        end

        def collapsed?
          collapsed || traits.include?(:collapsed)
        end

        def collapsible_toggle_html_options
          { href: "##{collapsible_target_id}",
            data: data.merge!(toggle: 'collapse'),
            aria: aria.merge!(**build_aria(aria_key: :expanded, aria_value: collapsed?),
                              **build_aria(aria_key: :controls, aria_value: collapsible_target_id)) }
        end

        def collapsible_trait
          collapsed? ? :collapsed : :collapsible
        end

        private

        def required
          [:id]
        end

        def collapsible_wrapper_html
          view_context.content_tag(:div,
                                   collapsible_body_html,
                                   id: collapsible_target_id,
                                   class: collapsible_target_css_classes)
        end

        def collapsible_body_html
          view_context.content_tag(:div,
                                   options[:body],
                                   html_options)
        end

        def collapsible_target_css_classes
          ['collapse', expanded_collapse_css_class].reject(&:nil?).join(' ').squish
        end

        def collapsible_target_id_error
          raise NoMethodError.new "
NoMethodError occurred in NfgUi::Bootstrap::Utilities::Collapsible#collapsible_target_id_error
#{self.class} is missing a #collapsible_target_id\n\nYou must define a #collapsible_target_id method on #{self.class} when you `include NfgUi::Bootstrap::Utilities::Collapsible`

Example:

module NfgUi
  module Components
    module Patterns
      Class NewComponent < NfgUi::Components::Base
        private

        def collapsible_target_id
          collapsible? ? \"target_collapsible_id_for_\#\{id\}\" : ''
        end
      end
    end
  end
end"
        end

        def expanded_collapse_css_class
          'show' unless collapsed?
        end

        def non_html_attribute_options
          super.push(:collapsed)
        end

        def defaults
          super.merge!(collapsed: default_collapsed)
        end

        def default_collapsed
          false
        end

        def collapsible_traits
          %i[collapsible collapsed]
        end
      end
    end
  end
end
