# desc "Explaining what the task does"
# task :nfg_ui do
#   # Task goes here
# end

Rake::Task['assets:precompile'].enhance do
  Rake::Task['nfg_ui:copy_public_assets'].invoke
end

namespace :nfg_ui do
  task :copy_public_assets => :"assets:environment"  do
    assets = Dir.glob(Rails.root.join('public', 'nfg_ui'))
    assets.each do |asset|
      source_file = File.join(NfgUi::Engine.root, 'public', 'nfg_ui', asset)
      dest_file = File.join(Rails.root, 'public', asset)
      FileUtils.copy_file source_file, dest_file, true
    end
  end
end