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

        def modal
          options.fetch(:modal, nil)
        end

        private

        # Corresponds to i18n locale: config/locales/en.yml
        # Remote is checked first, given its importance and impact on the application
        # Then, check for tooltip.
        def error_message_i18n_path
          return 'remote' if options[:remote]
          return 'tooltip' if options[:tooltip]
        end

        # Force an error when:
        # 1. The component includes remote: true (and the modal option is present)
        # 2. The component includes a :tooltip in the options
        #
        # When a tooltip is present, the data-toggle would be overwritten with
        # the modal data attributes (given the `data.merge!`) causing a silent failure
        # of the tooltip (it doesn't get added to the component)
        def component_includes_problematic_options_for_modal?
          modal.present? && (options.fetch(:remote, nil) || illegal_tooltip?)
        end

        # When a modalable component is disabled
        # the tooltip is applied to a wrapping element
        # and will not compete with the modal's data attributes.
        def illegal_tooltip?
          options[:tooltip].present? && !options[:disabled]
        end

        def non_html_attribute_options
          super.push(:modal)
        end
      end
    end
  end
end
