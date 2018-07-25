# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Alert traits
      module Alert
        include NfgUi::Components::Traits::Theme

        private

        def error_trait
          @theme = :danger
          @heading = 'Oops!'
          @body = 'There was an error! Please review this submission and try again'
        end

        def allowed_traits
          [*bootstrap4_themes, :dismissible, :error]
        end

        def skipped_traits
          [*bootstrap4_themes, :dismissible]
        end
      end
    end
  end
end
