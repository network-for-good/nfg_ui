# frozen_string_literal: true

module NfgUi
  # Exposes nfg_ui rendering method
  module ApplicationHelper
    include NfgUi::Builder

    # Exposed here for convenience -- otherwise #nfg_ui seems
    # awfully magical and perhaps challenging to track down
    # in a hurry (if missing what NfgUi::Builder does)
    def nfg_ui(component_name, trait = nil, **options, &block)
      super
    end
  end
end
