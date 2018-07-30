# frozen_string_literal: true

module NfgUi
  module UI
    # The base component building class for namespaced
    # components (bootstrap vs network_for_good / nfg)
    class Base
      include NfgUi::UI::Utilities::Initializer
      # Child classes manage initialization
      # Base collects the view_context to supply the
      # render_component method with the appropriate ActionView
      def initialize(view_context, *)
        p "====== (UI::Base) self.class.name: #{self.class.name} method: #{__method__}"
        self.view_context = view_context
      end

      def bootstrap?
        p "====== (UI::Base) self.class.name: #{self.class.name} method: #{__method__}"
        false
      end

      def nfg?
        p "====== (UI::Base) self.class.name: #{self.class.name} method: #{__method__}"
        false
      end

      def bootstrap(component_name = nil, *traits, **options, &block)
        p "====== (UI::Base) self.class.name: #{self.class.name} method: #{__method__}"
        NfgUi::UI::Bootstrap.new(view_context, component_name, *traits, **options, &block).render_component
      end

      def nfg(component_name = nil, *traits, **options, &block)
        p "====== (UI::Base) self.class.name: #{self.class.name} method: #{__method__}"
        NfgUi::UI::NetworkForGood.new(view_context, component_name, *traits, **options, &block).render_component
      end

      protected

      # Render outside of a controller reference:
      # Necessary for rails 4+ compatibility since rails 4 doesn't have
      # rails 5 fanciness with rendering anywhere.
      # https://www.thegreatcodeadventure.com/rendering-views-outside-of-actions-with-action-view/
      def render_component
        p "====== (UI::Base) self.class.name: #{self.class.name} method: #{__method__}"
        view_context.render partial: partial_path, locals: { component_name => component }
      end

      private

      def ancestry_string
        p "====== (UI::Base) self.class.name: #{self.class.name} method: #{__method__}"
        ''
      end

      def component_family
        p "====== (UI::Base) self.class.name: #{self.class.name} method: #{__method__}"
        component.send(:component_family).presence
      end

      def grouping_folder
        p "====== (UI::Base) self.class.name: #{self.class.name} method: #{__method__}"
        ''
      end

      def group; end

      def components_within_group(*)
        p "====== (UI::Base) self.class.name: #{self.class.name} method: #{__method__}"
        []
      end

      def partial_path
        p "====== (UI::Base) self.class.name: #{self.class.name} method: #{__method__}"
        [
          'nfg_ui',
          grouping_folder,
          component_name_folder,
          component_name
        ].reject(&:nil?).join('/').chomp
      end
    end
  end
end
