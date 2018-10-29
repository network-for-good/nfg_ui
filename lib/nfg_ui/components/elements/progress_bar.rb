# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # ProgressBar doc coming soon
      class ProgressBar < Bootstrap::Components::Progress
        include NfgUi::Components::Utilities::Traitable
        include NfgUi::Components::Utilities::Describable
        include Bootstrap::Utilities::Tooltipable
        include NfgUi::Components::Traits::Theme

        # need to pass the tooltip to the wrapper
        def data
          tooltip ? super.except(:toggle, :placement, :html) : super
        end

        def html_options
          tooltip ? super.except(:title) : super
        end

        def progress_wrapper_html_options
          tooltip ? super.merge!(data: tooltip_data_attributes, title: tooltip) : super
        end
      end
    end
  end
end
