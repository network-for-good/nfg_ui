module NfgUi
  # Exposes nfg_ui rendering method
  module ApplicationHelper
    require 'nfg_ui/helpers/render'
    include NfgUi::Helpers::Render

    def nfg_ui(component_name, trait = nil, **options, &block)
      super
    end
  end
end
