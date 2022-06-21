# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Button traits
      module Button
        TRAITS = %i[block
                    close
                    link
                    outlined
                    remote
                    submit].freeze

        # Link trait has some customizations because it outputs
        # a button without button styles (useful for spacing)
        # which makes it feel like the following SHOULD work:
        # = ui.nfg :button, :link, :danger, icon: 'trash-o'
        # Where it generates a link themed button that also has
        # a color style.
        def link_trait
          colors = NfgUi::Components::Traits::Theme::COLOR_TRAITS

          # Check if we've got any color themes passed through in addition to :link
          if traits.collect { |t| t.in?(colors) }.any? && traits.include?(:link)
            # Grab and remove the theme color from traits so it
            # doesn't override the :link theme
            # and so that we can apply it to the css.
            theme_color = traits.delete((traits & colors).first)

            # Add the text styling to the button's CSS
            options[:class] += " text-#{theme_color}"
          end

          # And finally, set the official theme as a link
          options[:theme] = :link
        end

        def block_trait
          options[:block] = true
        end

        def close_trait
          self.as = :button
          data[:dismiss] = options.delete(:dismiss)
          options[:theme] = nil
          @css_classes = 'close'
          @body = '&times;'.html_safe
          assistive_html_attributes.merge!(aria: { label: 'close' })
        end

        def remote_trait
          options[:remote] = true
        end

        def submit_trait
          self.as = :button
          options[:type] = 'submit'
        end

        def outlined_trait
          options[:outlined] = true
        end
      end
    end
  end
end
