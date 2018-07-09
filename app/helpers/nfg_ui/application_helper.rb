# frozen_string_literal: true

module NfgUi
  # Core rendering helper methods
  module ApplicationHelper

    # render components from the pertinent suite
    # Network for Good components: = ui.nfg
    # Bootstrap core components:   = ui.bootstrap
    def ui
      NfgUi::UI::Base.new(controller.view_context)
    end
  end
end
