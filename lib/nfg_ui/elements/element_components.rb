# frozen_string_literal: true
module NfgUi
  module Elements
    module ElementComponents
      require_relative 'alert'

      def element_components
        [:activity,
         :alert,
         :badge,
         :button,
         :chart,
         :dropdown,
         :form_group,
         :input_group,
         :key,
         :list_group_item,
         :loader,
         :media_object,
         :nav,
         :popover,
         :progress_bar,
         :slat,
         :table,
         :task,
         :tooltip]
      end
    end
  end
end
