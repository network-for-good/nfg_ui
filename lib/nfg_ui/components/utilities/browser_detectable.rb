# frozen_string_literal: true

module NfgUi
  module Components
    module Utilities
      # Add browser detection to the desired component
      module BrowserDetectable
        require 'browser'

        # Allow .mobile? .tablet?, etc to work
        # on browser.mobile?
        # to support legacy implementation and not require
        # the addition of `device`, ex:
        # browser.device.tablet? is not necessary when Aliases are included.
        # see: https://github.com/fnando/browser#aliases
        require 'browser/aliases'
        Browser::Base.include(Browser::Aliases)

        def browser
          Browser.new(get_user_agent)
        end

        private

        # Provide the user agent to #browser
        def get_user_agent
          # If `browser` method is called from a rails view
          if defined?(controller)
            controller.view_context.request.user_agent

          # Else `browser` method was called from a ruby component
          elsif defined?(view_context)
            view_context.request.user_agent
          end
        end
      end
    end
  end
end
