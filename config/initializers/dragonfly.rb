require 'dragonfly'
require 'dragonfly/s3_data_store'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  #Turn off else the caching breaks on the phone

  #protect_from_dos_attacks true
  secret Settings.general.secret_key_base
  verify_urls false

  url_format "/media/:job/:name"
  url_host Settings.host.assets_base

  fetch_file_whitelist [
                           /public/
                       ]

  if Settings.s3.region and Settings.s3.bucket_name and Settings.s3.access_key_id and Settings.s3.secret_access_key
    datastore :s3,
              region: Settings.s3.region,
              bucket_name: Settings.s3.bucket_name,
              access_key_id: Settings.s3.access_key_id,
              secret_access_key: Settings.s3.secret_access_key
  else
    datastore :file,
              root_path: Rails.root.join('public/system/dragonfly', Rails.env),
              server_root: Rails.root.join('public')
  end
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware
