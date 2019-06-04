# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed theme traits
      module Theme
        COLOR_TRAITS = %i[primary
                          secondary
                          success
                          danger
                          warning
                          info
                          light
                          dark
                          white]

        TRAITS = [*COLOR_TRAITS,
                  :outlined].freeze



        def primary_trait
          options[:theme] = :primary
        end

        def secondary_trait
          options[:theme] = :secondary
        end

        def success_trait
          options[:theme] = :success
        end

        def danger_trait
          options[:theme] = :danger
        end

        def warning_trait
          options[:theme] = :warning
        end

        def info_trait
          options[:theme] = :info
        end

        def light_trait
          options[:theme] = :light
        end

        def dark_trait
          options[:theme] = :dark
        end

        def white_trait
          options[:theme] = :white
        end

        def outlined_trait
          options[:outlined] = true
        end
      end
    end
  end
end
