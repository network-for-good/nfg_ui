# frozen_string_literal: true

module NfgUi
  module UI
    # The base component building class for namespaced
    # components (bootstrap vs network_for_good / nfg)
    class Base
      attr_accessor :view_context

      def initialize(view_context)
        p "====== Printed from: (UI::Base) self.class.name: #{self.class.name} method: #{__method__}"
        self.view_context = view_context
      end

      def bootstrap(component_name = nil, *traits, **options, &block)
        p "====== Printed from: (UI::Base) self.class.name: #{self.class.name} method: #{__method__}"
        NfgUi::UI::Bootstrap.new(view_context, component_name, *traits, **options, &block).render_component
      end

      def nfg(component_name = nil, *traits, **options, &block)
        p "====== Printed from: (UI::Base) self.class.name: #{self.class.name} method: #{__method__}"
        NfgUi::UI::NetworkForGood.new(view_context, component_name, *traits, **options, &block).render_component
      end
    end
  end
end
