# frozen_string_literal: true

module NfgUi
  # Exposes nfg_ui rendering method
  module ApplicationHelper
    include NfgUi::Builder

    def nfg_ui(component_name, trait = nil, **options, &block)
      super
    end
  end
end
