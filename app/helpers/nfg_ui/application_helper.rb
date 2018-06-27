module NfgUi
  # Exposes nfg_ui rendering method
  module ApplicationHelper
    include NfgUi::Helpers::Render

    def nfg_ui(component_name, trait = nil, **options, &block)
      super
    end
  end
end
