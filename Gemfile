source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gemspec

gem 'haml'
gem 'execjs', '~> 2.7.0' # later versions break our deploy & publish processes; see DM and FP Gemfiles
gem 'activestorage', '7.2.2.2' # pinned: security fix, exact maintenance-branch version

group :development do
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'byebug'
end

group :test do
  gem 'spring-commands-rspec'
end
