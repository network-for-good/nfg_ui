source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gemspec

gem 'haml'
gem 'execjs', '~> 2.7.0' # later versions break our deploy & publish processes; see DM and FP Gemfiles

group :development do
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'byebug'
end

group :test do
  gem 'spring-commands-rspec'
end
