# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Alert doesn't have any customizations unique to the design system yet
      # As such, the NFG UI alert is simply a bootstrap alert behind the scenes.
      # Traits will eventually be connected here.
      class Alert < NfgUi::Bootstrap::Components::Alert
        p ":::::: #{__FILE__.split('/').last.to_s} :::::: #{__FILE__} :::::: Loaded"
      end
    end
  end
end
