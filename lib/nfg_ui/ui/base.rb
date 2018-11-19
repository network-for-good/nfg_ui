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
        NfgUi::UI::Bootstrap.new(view_context, component_name, *traits, **options, &block).render_component
      end

      def nfg(component_name = nil, *traits, **options, &block)
        return unless render_nfg_component?(options)
        NfgUi::UI::NetworkForGood.new(view_context, component_name, *traits, **options, &block).render_component
      end

      private

      def render_nfg_component?(options)
        return true unless options.key?(:render_if) || options.key?(:render_unless)
        if options.key?(:render_if)
          options[:render_if].present?
        else
          options[:render_unless].blank?
        end
      end
    end
  end
end
