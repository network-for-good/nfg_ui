# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows a component to utilize the :modal option
      # Which then formats the component's HTML data attributes
      # to connect to the desired modal. Note the :modal option requires the '#'
      # preceding the CSS ID per bootstrap docs
      #
      # Correct:   { modal: '#the_modal_id' } <-- note the '#'
      # Incorrect: { modal: 'the_modal_id' }
      #
      # USAGE:
      # When to use the :modal option on a component:
      # The :modal option should only be used when activating a modal
      # that has been embedded on the HTML page and is not being injected
      # from a remote ajax request via remote: true.
      #
      # INVALID USAGE:
      # Do not set a modal option on a remote link in Rails
      # Setting a component to remote: true in addition to suppling a modal
      # will result in an ArgumentError. This is due to poor / buggy behavior resulting from
      # remotely re-rendering a modal that is already on the page
      #
      # (basically: there's a high likelihood that the targeted modal will
      # be shown / animated twice)
      #
      # Like when remote: true, components that contain tooltips
      # Will also raise an ArgumentError due to the competing data-toggles
      # and the subsequent silent failure of the tooltip.
      #
      # EXCEPTIONS:
      # Exception for a modalable component with a tooltip:
      # *Disabled* components may use a modal and a tooltip in its options
      # (thanks to how disabled components are wrapped with an html element & the tooltip
      # is applied to the wrapping element, not the component itself)
      #
      # Valid example:
      # = ui.bootstrap :button, disabled: true, tooltip: 'The tooltip', modal: '#the_modal', ...
      #
      # Extra care is taken with the modal and competing options given its typical wide-ranging
      # use in rails applications.
      module Modalable
        def modal
          options.fetch(:modal, nil)
        end

        def data
          # Do not allow a :remote component to utilize a modal as well
          if options.fetch(:remote, nil) && modal.present?
            raise ArgumentError.new(I18n.t('nfg_ui.errors.argument_error.modalable.remote',
                                     modal: modal,
                                     class_name: self.class.name,
                                     options: options,
                                     file: __FILE__,
                                     method: __method__))
          end

          # Overwrites data-toggle and data-target
          # forcing the modal to take precedence.
          # If a tooltip is present in the options, an ArgumentError is raised
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
