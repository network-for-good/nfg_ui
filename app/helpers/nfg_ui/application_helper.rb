# frozen_string_literal: true

module NfgUi
  # Core rendering helper methods
  module ApplicationHelper
    # render components from the pertinent suite
    # Network for Good components: = ui.nfg
    # Bootstrap core components:   = ui.bootstrap
    include FontAwesome::Rails::IconHelper

    def ui
      NfgUi::UI::Base.new(get_view_context)
    end

    private

    # presenter class controller may not be defined
    def get_view_context
      if defined?(controller) && controller.present?
        controller.view_context
      else
        ApplicationController.new.view_context
      end
    end
  end
end
