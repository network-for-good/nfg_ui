module NfgUi
  module UI
    class Base
      include Utilities::Initializer

      # Child classes manage initialization
      def initialize; end

      def bootstrap?
        false
      end

      def nfg?
        false
      end

      def bootstrap(component_name = nil, *traits, **options, &block)
        NfgUi::UI::Bootstrap.new(component_name, *traits, **options, &block).render_component
      end

      def nfg(component_name = nil, *traits, **options, &block)
        NfgUi::UI::NetworkForGood.new(component_name, *traits, **options, &block).render_component
      end

      protected

      def render_component
        ActionController::Base.render partial: partial_path, locals: { component_name => component }
      end

      private

      def ancestry_string
        ''
      end

      def component_family
        component.send(:component_family).presence
      end

      def grouping_folder
        ''
      end

      def group; end

      def components_within_group(*)
        []
      end

      def partial_path
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
