source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gemspec

gem 'haml'
gem "nokogiri", ">= 1.10.4" # see: https://nvd.nist.gov/vuln/detail/CVE-2019-5477

group :development do
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'byebug'
end

group :test do
  gem 'spring-commands-rspec'
end
