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

  # Bootstrap4.3.1 allows for upgrading past 9.4.10 which requires ruby >= 2.4.
  # When running `bundle update nfg_ui` from Evo.
  # Evo is officially on ruby 2.3.7 so autoprefixef must
  # be manually set.
  s.add_dependency 'autoprefixer-rails', '9.4.9'
  s.add_dependency 'bootstrap', '4.3.1'
  s.add_dependency 'browser', '~> 1.1' # To be upgraded later -- very out of date, but required by Evo at this lower version.
  s.add_dependency 'coffee-script', '~> 2.4'
  s.add_dependency 'font-awesome-rails', '~> 4.7'
  s.add_dependency 'inky-rb', '~> 1.3.7'
  s.add_dependency 'jquery-rails', '~> 4.3'
  s.add_dependency "nokogiri", ">= 1.10.4" # must manually set nokogiri to a higher version for security high risk vulnerability issues. See: https://nvd.nist.gov/vuln/detail/CVE-2019-5477
  s.add_dependency 'rails', '>= 4.2.0'
  s.add_dependency 'sass-rails', '~> 5.0'
  s.add_dependency 'select2-rails', '~> 4.0'
  s.add_dependency 'momentjs-rails', '~> 2.11', '>= 2.11.1' # client side date formatting - used for bootstrap-datetimepicker


  s.add_development_dependency 'capybara', '~> 3.9'
  s.add_development_dependency 'chromedriver-helper', '~> 2.1'
  s.add_development_dependency 'factory_bot_rails', '~> 4.11'
  s.add_development_dependency 'puma', '~> 3.12'
  s.add_development_dependency 'rails-controller-testing', '~> 1.0' # for assert-template
  s.add_development_dependency 'rspec_junit_formatter', '~> 0.4'
  s.add_development_dependency 'rspec-rails', '~> 3.8'
  s.add_development_dependency 'selenium-webdriver', '~> 3.14'
  s.add_development_dependency 'simplecov', '~> 0.16'
  s.add_development_dependency 'sprockets', '~> 3.7', '>= 0'
  s.add_development_dependency 'sqlite3', '~> 1.3'
end