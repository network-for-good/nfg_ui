# frozen_string_literal: true

module NfgUi
  module Components
    module Utilities
      # Add browser detection to the desired component
      module BrowserDetectable
        require 'browser'

        attr_reader :browser
        
        def initialize(*)
          super
          @browser = Browser.new(user_agent: view_context.request.env['HTTP_USER_AGENT'])
        end
      end
    end
  end
end
