# frozen_string_literal: true

module NfgUi
  module UI
    # The base component building class for namespaced
    # components (bootstrap vs network_for_good / nfg)
    class Base
      attr_accessor :view_context

      def initialize(view_context)
        self.view_context = view_context
      end

      def bootstrap(component_name = nil, *traits, **options, &block)
        traits, options = process_traits_and_options(*traits, **options)
        NfgUi::UI::Bootstrap.new(view_context, component_name, *traits, **options, &block).render_component
      end

      def nfg(component_name = nil, *traits, **options, &block)
        traits, options = process_traits_and_options(*traits, **options)
        return unless render_nfg_component?(options)
        NfgUi::UI::NetworkForGood.new(view_context, component_name, *traits, **options, &block).render_component
      end

      private

      def render_nfg_component?(options)
        return true unless options.key?(:render_if) || options.key?(:render_unless)
        if options.key?(:render_if)
          options[:render_if]
        else
          !options[:render_unless]
        end
      end

      def process_traits_and_options(*traits, **options)
        # In ruby 3 keyword arguments are separated from positional arguments
        # Ensure traits is an array and default to an empty array if no elements are passed
        traits = traits.empty? ? [] : traits

        # Check if the last element of traits is a hash and merge it with options
        if traits.last.is_a?(Hash)
          options = traits.pop.merge(options)
        end

        [traits, options]
      end
    end
  end
end
