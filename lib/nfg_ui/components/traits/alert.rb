# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Alert traits
      module Alert
        TRAITS = %i[tip].freeze

        def tip_trait
          options[:icon] = 'lightbulb-o'
          options[:theme] = :info
          options[:dismissible] = false
        end
        # include NfgUi::Components::Traits
        # include NfgUi::Components::Traits::Theme

        # private

        # def error_trait
        #   @theme = :danger
        #   @heading = 'Oops!'
        #   @body = 'There was an error! Please review this submission and try again'
        # end

        # def allowed_traits
        #   super.push(:dismissible, :error)
        # end

        # def skipped_traits
        #   super.push(:dismissible)
        # end
      end
    end
  end
end
