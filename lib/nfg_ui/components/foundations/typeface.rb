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
      # With a block:
      # = ui.nfg :typeface, :title do
      #   Some title
      #   %span.foobar{ data: { foo: 'bar' } }= foo.bar
      #
      # Arguments:
      # = ui.nfg(component, trait, text)
      #
      # = ui.nfg(component, trait) do
      #   &block
      #
      # or manually declare your content type without a trait
      # = ui.nfg(component, heading: 'heading')
      class Typeface < NfgUi::Components::Base
        include NfgUi::Components::Utilities::Iconable
        include NfgUi::Components::Utilities::Titleable
        include NfgUi::Components::Traits::Typeface

        attr_reader :text, :trait

        def initialize(*)
          super
          @text = traits[1].presence || options[active_typeface_option] || body
          @trait = traits.first.presence

          typeface_error if text_trait_is_not_a_string?
        end

        def typeface_html
          generate_typeface_html
        end

        private

        def component_css_class
          ''
        end

        def generate_typeface_html
          send "#{active_typeface_option}="
        end

        def text_trait_is_not_a_string?
          active_typeface_options.size > 1 || !text.is_a?(String)
        end

        def typeface_error
          raise ArgumentError.new "#{self.class.name} only accepts text-based content once, permissible content traits/options are: #{allowed_typeface_options} or an &block.\n\n#{self.class.name} are rendered with these variations:\nui.nfg(:typeface, :title, 'Text')\nui.nfg(:typeface, title: 'text')\n\nOr with a block:\n\nui.nfg(:typeface, :title) do\n  Text content"
        end

        def allowed_typeface_options
          %i[heading body title]
        end

        def active_typeface_options
          (options.reject { |_k, v| v.blank? }.keys & allowed_typeface_options)
        end

        def active_typeface_option
          trait.present? && body.present? ? trait : active_typeface_options.first
        end
      end
    end
  end
end
