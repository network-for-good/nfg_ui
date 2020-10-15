begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rdoc/task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'NfgUi'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

APP_RAKEFILE = File.expand_path("spec/test_app/Rakefile", __dir__)

load 'rails/tasks/engine.rake'
load 'rails/tasks/statistics.rake'

require 'bundler/gem_tasks'

desc <<~DESC
  Publish precompiled assets to s3://nfg-ui.  This task is automatically invoked after successful "rake release" and normally it should not be called directly.
  Requires installation of AWS CLI: https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html
  Please see additional instructions in README.md.
DESC
task :publish, %i[override_flag] do |_, override_flag: nil|
  require 'fileutils'

  version = Bundler.load_gemspec("#{__dir__}/nfg_ui.gemspec").version
  puts "Compiling and publishing NFG UI v#{version} assets"

  subtask_args = version.to_s
  subtask_args << ",#{override_flag}" if override_flag

  Dir.chdir("#{__dir__}/publisher") do
    Bundler.with_unbundled_env do
      sh "RAILS_ENV=production bundle exec rake publish[#{subtask_args}]" do |ok, _|
        puts 'unable to publish assets' unless ok
      end
    end
  end
end

Rake::Task['release'].enhance do
  Rake::Task['publish'].invoke # runs :publish task after successful release
end
