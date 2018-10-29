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
        # if options[:render_if].nil?
        #   !options[:render_unless] || true
        # elsif options[:render_unless].nil?
        #   options.fetch(:render_if, true)
        # else
        #   true
        # end

        # "render if this is false"

        if options[:render_if].nil? && options[:render_unless].nil?
          true
        elsif options[:render_if]
          options[:render_if]
        elsif options[:render_unless] == true
          false
        elsif options[:render_unless] == false
          true
        end
      end

      # def render_if(options)
      #   options.fetch(:render_if, true)
      # end

      # def render_unless(options)
      #   # options.fetch(:render_unless, nil)
      #   options.fetch(:render_unless, true)

      # end
    end
  end
end
