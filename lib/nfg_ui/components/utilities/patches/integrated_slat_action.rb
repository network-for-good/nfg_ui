# frozen_string_literal: true

# This module should be removed upon re-evaluation of Slat components.
module NfgUi
  module Components
    module Utilities
      module Patches
        # Terminology:
        # SlatAction  - is the equivalent of a dropdown menu item
        # SlatActions - is the parent / wrapping component of the SlatAction(s)
        #
        # and... Integrated Slat Action essentially replaces a dropdown toggle & dropdown menu with either a text link or a button component.
        #
        # Usage: When you are creating a slat that does not need a menu but has a singular action link
        # For example: when the only option you have on a slat is to delete that item.
        #
        # This module allows you to pass in options that will
        # automatically generate a slat action for you
        # ... without having to manually add a slat_action to your code.
        #
        # Example usage:
        # = ui.nfg :slat_actions, menu: false, icon: 'trash', body: 'Delete', href: '#nogo'
        #
        # The above will automatically generate a slat action so you
        # do not need to add a slat action in the slat_actions (note: plural slat_actions)
        #
        # This is a monkeypatch while we re-evaluate the Slat component suite
        # so as not to break existing code implementation on our apps.
        module IntegratedSlatAction
          # Allows for icons to be passed into the integrated slat action component
          include NfgUi::Components::Utilities::Iconable

          # Allows for using theme traits on the slat action component
          # that is then passed through to the integrated slat action.
          include NfgUi::Components::Traits::Theme

          # This sets whether or not the SlatAction is a button.
          # If it's not a button, the integrated slat action
          # is rendered via a content_tag as a normal link.
          #
          # If it is a button, the integrated slat action
          # is rendered as a button component
          # (NfgUi::Components::Elements::Button)
          def button
            options.fetch(:button, false)
          end

          # Passes in the rails confirm option to the slat action component.
          # Rails example: link_to 'Delete', ..., confirm: 'Are you sure?'
          def confirm
            options.fetch(:confirm, nil)
          end

          # Passes the :disable_with option, when present, to the
          # integrated slat action component -- this adds the rails disable_with
          # Rails example: link_to 'Delete', ..., disable_with: 'Deleting...'
          def disable_with
            options.fetch(:disable_with, nil)
          end

          # Sets a fallback for href so that
          # integrated action items are still
          # correctly styled
          def href
            super || '#'
          end

          # Passes in the rails confirm option to the slat action component.
          # Rails example: link_to 'Update', ..., method: :patch
          def method
            options.fetch(:method, nil)
          end

          # Allow for outline settings to be added
          # Assumes true if `button: true` per design system
          # style guide expectations.
          def outlined
            options[:outlined] || button
          end

          # Passes in the rails :remote option to the slat action component
          # Rails example: link_to 'Get Started', remote: true
          def remote
            options.fetch(:remote, nil)
          end

          # Render the component!
          def render_integrated_slat_action
            button ? render_button : render_link
          end

          # Passes the standard `:theme` option to the integrated Slat Action
          #
          # When the slat action component is a `button` (`button: true`):
          # The integrated slat action will default to the `:secondary` theme
          # per the design system style guide.
          #
          # The default `:secondary` theme can be manually overridden by passing in a
          # `:theme` trait or `:theme` option to the parent SlatActions component.
          def theme
            options.fetch(:theme, nil)
          end

          private

          # Supplies the SlatActions with
          # the appropriate css classes for the action link
          # when the SlatActions is used to bypass writing a manual slat action component
          # This is complicated, and thus...
          # This is why we are creating a patching module -- so that we can later rip this stuff out.
          def integrated_slat_action_link_css_classes
            [
              ("text-#{theme}" if theme),
              'd-block'
            ].join(' ').squish
          end

          # Determines if the slat action component is a delete link
          # Evaluated by examining the :method option
          #
          # This is used to determine where to inject the `delete` HTML data attribute (data-method)
          # and value ('delete') in the integrated slat action's HTML options
          def delete_link?
            @delete_link ||= options.fetch(:method, nil) == :delete
          end

          # When the slat action component is a button component,
          # These are the compiled options that are passed
          # through from the SlatActions options into the integrated button's options.
          #
          # This also acts as a filter against what is allowed to pass
          # and what is not allowed to pass into the
          # integrated component.
          def integrated_slat_action_button_component_options
            { theme: (theme || :secondary),
              traits: traits,
              as: :a,
              confirm: confirm,
              disable_with: disable_with,
              href: href,
              method: send(:method),
              remote: remote,
              outlined: outlined,
              left_icon: icon }
          end

          # Given the complexity of the data-attributes,
          # this isolates them into their own method for ease
          # of following what's going on.
          #
          # Essentially, since the :delete method is actually
          # converted to a data-attribute in rails, we
          # have to manually merge the `data-method='delete'` into the data attributes hash
          #
          # This brings the whole data-attributes suite together
          # and optionally merges in the data-method='delete' if
          # this is a delete button/link.
          def integrated_slat_action_html_data_attributes
            mergable_delete_link = delete_link? ? { method: :delete } : {}

            { disable_with: disable_with,
              confirm: confirm }.merge(mergable_delete_link)
          end

          # The HTML options that are passed into the manually created slat action component
          # For instances where you are bypassing the manual slat action component by leveraging the
          def integrated_slat_action_html_options
          { href: href,
            class: integrated_slat_action_link_css_classes,
            method: send(:method),
            remote: remote,
            data: integrated_slat_action_html_data_attributes }
          end

          # These options are removed from attributes because
          # they are picked up and placed on the *SlatActions*
          # and not on the integrated *slat action component*
          def non_html_attribute_options
            super.push(:button, :confirm, :disable_with, :href, :method, :remote, :theme)
          end

          # When `:button` is `true`, this is what is rendered
          def render_button
            NfgUi::Components::Elements::Button.new({ **integrated_slat_action_button_component_options, body: (block_given? ? yield : body) }, view_context).render
          end

          # When `:button` is `false`, a link is rendered
          def render_link
            content_tag(:a, **integrated_slat_action_html_options) do
              if icon
                NfgUi::Components::Foundations::Icon.new({ traits: [icon], text: (block_given? ? yield : body), theme: theme }, view_context).render
              else
                (block_given? ? yield : body)
              end
            end
          end
        end
      end
    end
  end
end