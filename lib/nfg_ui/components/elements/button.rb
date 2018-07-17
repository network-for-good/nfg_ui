# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Button doesn't have any customizations unique to the design system yet
      # As such, the NFG UI Button is simply a bootstrap Button behind the scenes.
      # Traits will eventually be connected here.
      class Button < Bootstrap::Components::Button
        include NfgUi::Components::Utilities::Iconable
        include Bootstrap::Utilities::Tooltipable
        include NfgUi::Components::Traits::Button

        attr_reader :disable_with, :data

        def initialize(*)
          super
          @body = text_maybe_with_icon
          @disable_with = options[:disable_with]
          update_data_attributes if disable_with?
        end

        def disable_with?
          disable_with.present? || traits.include?(:disable_with)
        end

        private

        def disable_with_text
          disable_with.present? ? disable_with : view_context.ui.nfg(:icon,
                                                                     'spinner spin fw',
                                                                     text: 'Saving...')
        end

        def update_data_attributes
          data.merge!(disable_with: disable_with_text)
        end

        def defaults
          super.merge(disable_with: default_disable_with)
        end

        def non_html_attribute_options
          super.push(:disable_with)
        end

        def default_disable_with
          ''
        end
      end
    end
  end
end
