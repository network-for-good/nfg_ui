source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gemspec

gem 'haml', '~> 5.2' # the components call Haml 5 helpers (init_haml_helpers); Haml 6+ removed them
gem 'execjs', '~> 2.7.0' # later versions break our deploy & publish processes; see DM and FP Gemfiles
# Rails series for the default bundle (gemspec allows >= 7.2, < 8.2). The 7.2 CI leg uses gemfiles/rails_7_2.gemfile.
gem 'rails', '~> 8.1.0'
gem 'websocket-driver', '>= 0.8.2' # pinned: CVE-2026-61666 (Uncaught Exception, High)

group :development do
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'byebug'
end

group :test do
  gem 'spring-commands-rspec'
end
