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

  s.add_dependency 'bootstrap', '~> 4.1.1'
  s.add_dependency 'coffee-script'
  s.add_dependency 'font-awesome-rails'
  s.add_dependency 'haml'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'rails'
  s.add_dependency 'sass-rails'
  s.add_dependency 'select2-rails'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'sqlite3'
end
