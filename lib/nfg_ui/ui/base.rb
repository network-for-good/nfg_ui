module NfgUi
  module UI
    class Base
      # require 'active_support/core_ext/module/delegation'

      # delegate :to_param, :model_name, :to_partial_path, to: :product

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

      # Rails 4/5 render "anywhere" thanks to
      # https://github.com/brainopia/backport_new_renderer
      def render_component
        # self.send(:require, 'backport_new_renderer')
        ActionView::Base.new(
          Rails.configuration.paths['app/views']
        ).render(
          partial: partial_path,
          format: :txt,
          locals: { component_name => component }
        )

        # ApplicationController.renderer.render template: partial_path, assigns: {}, locals: { component_name => component }

        # ApplicationController.new.render_to_string(
        #   :template => partial_path
        #   # :layout => 'my_layout',
        #   :locals => { component_name => component }
        # )
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
