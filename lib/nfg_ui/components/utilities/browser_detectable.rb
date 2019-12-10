# frozen_string_literal: true

module NfgUi
  module Components
    module Utilities
      # Add browser detection to the desired component
      module BrowserDetectable
        require 'browser'
        require 'browser/aliases'

        Browser::Base.include(Browser::Aliases)

        def browser
          Browser.new(get_user_agent)
        end

        private

        # Provide the HTTP_USER_AGENT to browser
        def get_user_agent
          # If called from a view
          if defined?(controller)
            controller.view_context.request.user_agent

          # Elsif called from a ruby component
          elsif defined?(view_context)
            view_context.request.user_agent
          end
        end
      end
    end
  end
end
