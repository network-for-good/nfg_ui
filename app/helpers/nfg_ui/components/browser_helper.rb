#frozen_string_literal: true

module NfgUi
  module Components
    # provide the browser method for utilizing Browser gem to host apps / engines
    module BrowserHelper
      require 'nfg_ui/components/utilities/browser_detectable'
      include NfgUi::Components::Utilities::BrowserDetectable
    end
  end
end