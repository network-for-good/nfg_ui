# frozen_string_literal: true

module NfgUi
  module Components
    module Foundations
      # Typeface doc coming soon
      # Note: this component should not be used outside of the gem
      # This isn't strictly enforced (yet), but will be.
      #
      # Example usage:
      # = ui.nfg :typeface, :heading, tile_header.title
      #
      # Arguments:
      # = ui.nfg(component, trait, text)
      #
      # or manually declare your content type without a trait
      # = ui.nfg(component, heading: 'heading')
      class Typeface < NfgUi::Components::Base
        include NfgUi::Components::Utilities::Iconable
        include NfgUi::Components::Utilities::Titleable

        attr_accessor :text, :trait

        def initialize(*)
          super
          self.text = traits[1].presence || options[active_typeface_option]
          self.trait = traits.first.presence

          typeface_error if typeface_error?
        end

        def typeface_html
          generate_typeface_html
        end

        private

        def component_css_class
          ''
        end

        def generate_typeface_html
          if active_typeface_option
            send "trait_#{active_typeface_option}"
          elsif trait
            send "trait_#{trait}"
          end
        end

        def typeface_error?
          active_typeface_options.size > 1
        end

        def typeface_error
          raise ArgumentError.new "Typeface only accepts one content block, permissible content block potions are: #{allowed_typeface_options} or an &block. Or, via simplified syntax: ui.nfg(:typeface, :heading, 'The text')" and return
        end

        def allowed_typeface_options
          %i[heading body title]
        end

        def active_typeface_options
          (options.reject { |_k, v| v.blank? }.keys & allowed_typeface_options)
        end

        def active_typeface_option
          active_typeface_options.first
        end
      end
    end
  end
end
