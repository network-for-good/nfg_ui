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

        # Because it is common to forget to add the required :id
        # to the component options when doing a "speed built"
        # collapse, example:
        # = ui.nfg :collapse, :collapsed, body: 'Collapse body content', heading: 'My Link'
        #
        # Send in a random string that is carried through
        # from the speed built heading / button AND
        # to the collapse component.
        def component_initialize
          # Only create and supply a random ID this when a :heading is present
          return unless heading
          new_id = options[:id].nil? ? random_id : options[:id]
          options[:id] = new_id
        end

        def render
          capture do
            if heading
              icon = options.fetch(:icon, 'caret-down')
              opts = { collapse: "##{html_options[:id]}", body: heading, icon: icon, class: 'pl-0 text-left' }
              opts.merge!(traits: [:link, :block])
              concat(NfgUi::Components::Elements::Button.new(opts, view_context).render)
            end
            concat(super)
          end
        end

        private

        # Generate a string of random letters
        # We must insert a random letter before SecureRandom because
        # if a css ID starts with a number, it seems to break
        # the collapse JS functionality.
        def random_id
          "#{('a'..'z').to_a.sample}-#{SecureRandom.alphanumeric(6)}"
        end
      end
    end
  end
end
