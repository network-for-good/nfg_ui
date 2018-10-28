# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Button doesn't have any customizations unique to the design system yet
      # As such, the NFG UI Button is simply a bootstrap Button behind the scenes.
      # Traits will eventually be connected here.
      class Button < Bootstrap::Components::Button
        # include Bootstrap::Utilities::Tooltipable
        # attr_accessor :component_css_class

        include NfgUi::Components::Utilities::Iconable
        include NfgUi::Components::Utilities::Traitable

        include NfgUi::Components::Traits::Active
        include NfgUi::Components::Traits::Button
        include NfgUi::Components::Traits::Size
        include NfgUi::Components::Traits::Theme


        # def local_initialize
        #   @component_css_class = ''
          
        # end

        
        

        # attr_reader :disable_with, :data, :remote

        # # TODO
        # # Note: when remote: true ... modal won't fire from ajax when type='button' is present within forms
        # # current working solution is to set type: nil -- button by default (in Wrappable) sets type: button
        # # ... example:
        # # = ui.nfg :button, :primary,
        # #                   :block,
        # #                   as: :button,
        # #                   type: nil,
        # #                   class: "#{button_css_class}",
        # #                   disabled: (project_presenter.donation_area_state == :disable),
        # #                   data: { describe: 'campaign-donate-button' } ...
        # # 
        # # Write a feature spec for ajax / remote js forms.

        # def initialize(*)
        #   super
        #   @body = text_maybe_with_icon
        #   @disable_with = options.fetch(:disable_with, nil)
        #   @remote = options.fetch(:remote, false)
        #   update_data_attributes
        # end

        def disable_with
          options.fetch(:disable_with, default_disable_with)
        end

        def data
          if disable_with
            super.merge!(disable_with: disable_with)
          else
            super
          end
        end

        private

        def default_disable_with
          view_context.ui.nfg(:icon, :loader, text: 'Saving...')
        end

        # def disable_with_text
        #   disable_with.present? ? disable_with : view_context.ui.nfg(:icon,
        #                                                              'spinner spin fw',
        #                                                              text: 'Saving...')
        # end

        # def update_data_attributes
        #   updated_data = disable_with ? { disable_with: disable_with } : {}
        #   updated_data[:remote] = remote if remote

        #   data.merge!(updated_data)
        # end

        # def defaults
        #   super.merge(disable_with: default_disable_with)
        # end

        def non_html_attribute_options
          super.push(:disable_with)
        end

        # def default_disable_with
        #   false
        # end
      end
    end
  end
end
