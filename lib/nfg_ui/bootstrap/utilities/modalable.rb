# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows a component to utilize the :modal option
      # Which then automatically formats the component's data attributes
      # to connect to the desired modal. Note the modal option requires the '#'
      # per bootstrap docs.
      #
      # Example usage:
      # ui.nfg(:button, body: 'Modal Button', modal: '#the_target_modal_id')
      #
      # Will now activate this modal:
      # ui.nfg(:modal, body: 'The modal', id: 'the_target_modal_id')
      module Modalable
        def modal
          options.fetch(:modal, nil)
        end

        # Only overwrite data-toggle and data-target
        # The operating assumption is that activating a modal is more important
        # and thus, will take precedence over less valuable competing data toggles
        #
        # For example: ui.nfg(:button, modal: '#the_target_modal', tooltip: 'The Tooltip')
        # will ignore the tooltip (since tooltip is initialized via a competing data-toggle)
        def data
          modal ? super.merge!(toggle: 'modal', target: options[:modal]) : super
        end

        private

        def non_html_attribute_options
          super.push(:modal)
        end
      end
    end
  end
end
