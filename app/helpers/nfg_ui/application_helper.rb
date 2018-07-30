# frozen_string_literal: true

module NfgUi
  # Core rendering helper methods
  module ApplicationHelper
    # render components from the pertinent suite
    # Network for Good components: = ui.nfg
    # Bootstrap core components:   = ui.bootstrap
    def ui
      p "---------- NfgUi:ApplicationHelper.ui - STARTS ----------"
      NfgUi::UI::Base.new(controller.view_context)
    end
  end
end
