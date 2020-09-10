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

task :publish do
  require 'fileutils'

  version = Bundler.load_gemspec("#{__dir__}/nfg_ui.gemspec").version

  puts "Compiling and publishing NFG UI v#{version} assets"

  Dir.chdir("#{__dir__}/publisher") do
    Bundler.with_clean_env do
      sh "RAILS_ENV=production bundle exec rake publish[#{version}]" do |ok, res|
        puts "unable to publish assets (status = #{res.exitstatus})" unless ok
      end
    end
  end
end

# Disabling the release task for safety reasons until we're happy with how release->publish works
__END__
Rake::Task['release'].enhance do
  Rake::Task['publish'].invoke
end
