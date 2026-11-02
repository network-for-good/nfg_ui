source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gemspec

gem 'haml'
gem 'execjs', '~> 2.7.0' # later versions break our deploy & publish processes; see DM and FP Gemfiles
gem 'activestorage', '7.2.3.2' # pinned: security fix, exact maintenance-branch version
gem 'websocket-driver', '>= 0.8.2' # pinned: CVE-2026-61666 (Uncaught Exception, High)

group :development do
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'byebug'
end

group :test do
  gem 'spring-commands-rspec'
end
