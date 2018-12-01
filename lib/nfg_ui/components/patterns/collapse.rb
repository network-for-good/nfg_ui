# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Button Group doesn't have any customizations unique to the design system yet
      # As such, the NFG UI button group is simply a bootstrap button group behind the scenes.
      # Traits will eventually be connected here.
      class Collapse < NfgUi::Bootstrap::Components::Collapse
        include Bootstrap::Utilities::Headable

        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::Renderable

        include NfgUi::Components::Traits::Collapse

        def render
          if heading
            opts = { collapse: "##{id}", body: heading, icon: 'caret-down', class: 'pl-0 text-left' }
            opts.merge!(traits: [:link, :block])
            content << NfgUi::Bootstrap::Components::Button.new(opts, view_context).render
          end
          content << super
          content.join.html_safe
        end
      end
    end
  end
end
