# frozen_string_literal: true

# Capybara 3.40.0 (the latest release) resets a Chrome session between examples with
# `Storage.clearDataForOrigin(origin: '*')`. Chrome 158 rejects that wildcard origin
# ("invalid argument: * is not a valid URL"), which fails every js: true example at reset.
# Clear cookies through `Network.clearBrowserCookies` instead. Local/session storage are not
# used by this suite. Remove this once Capybara ships a fix.
module CapybaraChromeWildcardOriginReset
  def execute_cdp(cmd, params = {})
    if cmd == 'Storage.clearDataForOrigin' && params[:origin] == '*'
      super('Network.clearBrowserCookies')
    else
      super
    end
  end
end

if defined?(Capybara::Selenium::Driver::ChromeDriver)
  Capybara::Selenium::Driver::ChromeDriver.prepend(CapybaraChromeWildcardOriginReset)
end
