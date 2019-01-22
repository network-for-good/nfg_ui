# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows a component to utilize the :modal option
      # Which then formats the component's HTML data attributes
      # to connect to the desired modal. Note the modal option requires the '#'
      # preceding the ID per bootstrap docs
      #
      # Correct: { modal: '#the_modal_id' }
      # Not correct: { modal: 'the_modal_id' }
      #
      # When to use the :modal option on a component:
      # The :modal option should only be used when activating a modal
      # that has been embedded on the HTML page and is not being injected
      # from a remote ajax request via remote: true.
      #
      # Do not set a modal option on a remote link in Rails
      # Setting a component to remote: true in addition to suppling a modal
      # will result in an ArgumentError.
      module Modalable
        # attr_reader :remote

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
          if options.fetch(:remote, nil) && modal.present?
            raise ArgumentError.new(I18n.t('nfg_ui.errors.argument_error.modalable.remote',
                                     modal: modal,
                                     class_name: self.class.name,
                                     options: options,
                                     file: __FILE__,
                                     method: __method__))
          end

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
