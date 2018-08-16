# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows components to have a collapsed state when appropriate
      module Collapsible
        # include Bootstrap::Utilities::AriaAssistable

        # attr_reader :collapsed, :id

        # def initialize(*)
        #   super
        #   @collapsed = options.fetch(:collapsed, nil)
        #   @collapsible_target_id = collapsible_target_id unless collapsible_target_id.nil? && collapsible?
        #   collapsible_target_id_error if collapsible_target_id.nil?
        # end

        def collapse
          p "====== Printed from: (Bootstrap::Utilities::Collapsible) self.class.name: #{self.class.name} method: #{__method__}"
          options.fetch(:collapse, nil)
        end

        # def collapsed
        #   options.fetch(:collapsed, default_collapsed)
        # end

        def html_options
          p "====== Printed from: (Bootstrap::Utilities::Collapsible) self.class.name: #{self.class.name} method: #{__method__}"
          return super unless collapse
          component_data = options[:data] || {}
          super.merge!(data: component_data.merge!(collapse_data_attributes))
        end

        private

        # Buttons need to be able to to set a target on :buttons
        # and an href on links -- so this attribute is customizable if needed
        def collapse_data_attributes
          p "====== Printed from: (Bootstrap::Utilities::Collapsible) self.class.name: #{self.class.name} method: #{__method__}"
          @collapse_data_attributes ||= { toggle: 'collapse', target: collapse }
        end

        # To do: currently collapsible doesn't control the actual collapse
        # As such, there's no way to set aria-expanded on the button / toggle...
        # based on whether or not the collapse component is expanded or not
        #
        # To solve: how to address aria-expanded to accurately reflect the expanded status
        def assistive_html_attributes
          p "====== Printed from: (Bootstrap::Utilities::Collapsible) self.class.name: #{self.class.name} method: #{__method__}"
          return super unless collapse
          super.merge!(aria: { expanded: 'false', controls: collapse.tr('#','') }, role: 'button')
        end

        # def default_collapsed
        #   p "====== Printed from: (Bootstrap::Utilities::Collapsible) self.class.name: #{self.class.name} method: #{__method__}"
        #   NfgUi::Bootstrap::Components::Collapse.send(:default_collapsed)
        # end

        # def collapsed
        #   options.fetch(:collapsed, nil)
        # end

        # def collapsible
        #   options.fetch(:collapsible, false)
        # end

        # def collapsible?
        #   (traits & collapsible_traits).present? || collapsed
        # end

        # def collapsed?
        #   collapsed || traits.include?(:collapsed)
        # end

        # def collapsible_wrapper_html_options
        #   { class: collapsible_target_css_classes, id: collapsible_target_id }
        # end

        # def collapsible_toggle_html_options
        #   { href: "##{collapsible_target_id}",
        #     data: data.merge!(toggle: 'collapse',
        #                       collapse_icon: collapse_icon,
        #                       collapsed_icon: collapsed_icon),
        #     aria: aria.merge!(**build_aria(aria_key: :expanded, aria_value: collapsed?),
        #                       **build_aria(aria_key: :controls, aria_value: collapsible_target_id)) }
        # end

        private

        # def required
        #   [:id]
        # end

        # def collapse_icon
        #   'caret-up'
        # end

        # def collapsed_icon
        #   'caret-down'
        # end

        # def collapsible_wrapper_html
        #   view_context.content_tag(:div,
        #                            collapsible_body_html,
        #                            id: collapsible_target_id,
        #                            class: collapsible_target_css_classes)
        # end

        # def collapsible_body_html
        #   view_context.content_tag(:div,
        #                            options[:body],
        #                            html_options)
        # end

        # def collapsible_target_css_classes
        #   ['collapse', expanded_collapse_css_class].reject(&:nil?).join(' ').squish
        # end

        # def collapsible_target_id
        #   "target_collapsible_id_for_#{id}"
        # end

        # def expanded_collapse_css_class
        #   'show' unless collapsed?
        # end

        def non_html_attribute_options
          p "====== Printed from: (Bootstrap::Utilities::Collapsible) self.class.name: #{self.class.name} method: #{__method__}"
          super.push(:collapse)
        end

        # def defaults
        #   super.merge!(collapsed: default_collapsed)
        # end

        # def default_collapsed
        #   false
        # end

        # def default_collapsible
        #   false unless collapsible?
        # end

        # def collapsible_traits
        #   %i[collapsible collapsed]
        # end
      end
    end
  end
end
