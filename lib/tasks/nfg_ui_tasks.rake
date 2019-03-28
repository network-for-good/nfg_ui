# desc "Explaining what the task does"
# task :nfg_ui do
#   # Task goes here
# end

Rake::Task['assets:precompile'].enhance do
  Rake::Task['nfg_ui:copy_public_assets'].invoke
end

namespace :nfg_ui do
  task :copy_public_assets => :"assets:environment"  do
    assets = ['favicon.ico', 'apple-touch-icon.png']
    assets.each do |asset|
      source_file = File.join(MyEngine::Engine.root, 'public', asset)
      dest_file = File.join(Rails.root, 'public', asset)
      FileUtils.copy_file source_file, dest_file, true
    end
  end
end