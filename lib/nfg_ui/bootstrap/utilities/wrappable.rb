# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows component to swap out the main component wrapping element (ex. :div vs. :span)
      # Pass in :as -- only unique logic at the moment
      # is converting :link to :a for tag generation
      module Wrappable
        # attr_reader :href
        # attr_writer :as, :options

        # def initialize(component_options, *)
        #   super
        #   self.as = options.fetch(:as, assigned_html_wrapper_element)
        #   self.options = defaults.merge!(**defaults_for_link, **options) if link?
        #   @href = options.try(:href, nil)
        # end

        def as
          p "====== Printed from: (Bootstrap::Utilities::Wrappable) self.class.name: #{self.class.name} method: #{__method__}"
          options.fetch(:as, automatic_as)
        end

        # def html_options
        #   as == :button ? super.merge!(type: 'button') : super
        # end

        # def href
        #   p "====== Printed from: (Bootstrap::Utilities::Wrappable) self.class.name: #{self.class.name} method: #{__method__}"
        #   options.fetch(:href, nil)
        # end

        private

        

        def automatic_as
          p "====== Printed from: (Bootstrap::Utilities::Wrappable) self.class.name: #{self.class.name} method: #{__method__}"
          if href.present?
            :a
          elsif options[:type] == 'submit'
            :button
          else
            default_html_wrapper_element
          end
        end

        def non_html_attribute_options
          p "====== Printed from: (Bootstrap::Utilities::Wrappable) self.class.name: #{self.class.name} method: #{__method__}"
          super.push(:as)
        end

        

        # def defaults
        #   return super unless options[:as] == :a
        #   super.merge(href: '#')
        # end

        # # def html_wrapper_element
        # #   # @
        # # #   as_link? ? :a : as
        # # end

        # # private

        # # def assistive_html_attributes
        # #   as == :button ? super.merge(type: options.fetch(:type, 'button')) : super
        # # end

        # def non_html_attribute_options
        #   super.push(:as)
        # end

        # # def as_link?
        # #   as == :link
        # # end

        # # def assigned_html_wrapper_element
        # #   href ? :a : default_html_wrapper_element
        # # end

        # # # Set default_html_wrapper_element on individual components as needed
        def default_html_wrapper_element
          p "====== Printed from: (Bootstrap::Utilities::Wrappable) self.class.name: #{self.class.name} method: #{__method__}"
          @default_html_wrapper_element ||= :span
        end

        def assistive_html_attributes
          as == :button ? super.merge!(type: 'button') : super
        end

        # def link?
        #   html_wrapper_element == :a
        # end

        # def defaults_for_link
        #   { href: '#' }
        # end
      end
    end
  end
end
