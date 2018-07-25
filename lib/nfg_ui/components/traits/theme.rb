# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed theme traits
      module Theme
        private

        def primary_trait
          @theme = :primary
        end

        def secondary_trait
          @theme = :primary
        end

        def success_trait
          @theme = :success
        end

        def danger_trait
          @theme = :danger
        end

        def warning_trait
          @theme = :warning
        end

        def info_trait
          @theme = :info
        end

        def light_trait
          @theme = :light
        end

        def dark_trait
          @theme = :dark
        end

        def allowed_traits
          super.push(NfgUi::Bootstrap::Utilities::Themeable.bootstrap4_themes)
        end
      end
    end
  end
end
