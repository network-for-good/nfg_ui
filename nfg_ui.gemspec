$LOAD_PATH.push File.expand_path('lib', __dir__)

require 'nfg_ui/version'

Gem::Specification.new do |s|
  s.name        = 'nfg_ui'
  s.version     = NfgUi::VERSION
  s.authors     = ['Jonathan Roehm', 'Kyle Morin']
  s.email       = ['jonathan.roehm@networkforgood.com', 'kyle.morin@networkforgood.com']
  s.homepage    = 'https://github.com/network-for-good/nfg_ui'
  s.summary     = 'NFG UI front-end design system code for rapid product building'
  s.description = 'The embodied design system for Network for Good.'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'bootstrap', '4.2.1'
  s.add_dependency 'coffee-script'
  s.add_dependency 'font-awesome-rails'
  s.add_dependency 'haml'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'rails', '>= 4.2.0'
  s.add_dependency 'sass-rails'
  s.add_dependency 'select2-rails'
  # To be upgraded later
  # s.add_dependency 'browser', '~> 2.5.0'
  s.add_dependency 'browser', '~> 1.1'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rails-controller-testing' # for assert-template
  s.add_development_dependency 'rspec_junit_formatter'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'chromedriver-helper'
  s.add_development_dependency 'puma'
  s.add_development_dependency 'factory_bot_rails'
  s.add_development_dependency 'simplecov'
end
