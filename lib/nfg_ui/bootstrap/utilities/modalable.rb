# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows a component to utilize the :modal option
      # Which then automatically formats the component's data attributes
      # to connect to the desired modal. Note the modal option requires the '#'
      # preceding the ID per bootstrap docs ('#the_modal_id' not 'the_modal_id')
      # 
      # Usage notes:
      # 1. When to use:
      # The :modal option should only be used when calling to a modal
      # that has been embedded on the page (not for remote links, more below).
      # There are no detrimental effects to using the modal option on a 
      # component that does not have a corresponding modal, however it
      # does add useless data attributes to your component.
      # 
      # 2. Regarding ajax remotely rendered modals
      # When leveraging a :remote link that renders a modal remotely,
      # the component does _not_ need the modal option. Your action's js.erb
      # will/should render the partial within the modal as part of its javascript.
      # 
      # Example usage for (non-remote) embedded modal:
      # The modalable component:
      # ui.bootstrap(:button, body: 'Modal Button', modal: '#the_target_modal_id')
      #
      # The actual modal to be activated, embedded on the page:
      # ui.bootstrap(:modal, body: 'The modal', id: 'the_target_modal_id')
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
