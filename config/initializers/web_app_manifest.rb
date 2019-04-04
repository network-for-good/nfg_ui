Rails.application.config.assets.configure do |env|
  env.register_mime_type('application/manifest+json', extensions: ['.webmanifest'])
end