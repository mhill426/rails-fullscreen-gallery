if ENV["AWS_BUCKET"] &&
    ENV["AWS_ACCESS_KEY_ID"] &&
    ENV["AWS_SECRET_ACCESS_KEY"]

  Rails.logger.info "CarrierWave: configuring for AWS storage, AWS_BUCKET=#{ENV['AWS_BUCKET']}"
  CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV["AWS_ACCESS_KEY_ID"],                        # required
    :aws_secret_access_key  => ENV["AWS_SECRET_ACCESS_KEY"]                        # required
  }
  config.fog_directory  = ENV["AWS_BUCKET"]                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  config.storage :fog
	end
else
  Rails.logger.info "CarrierWave: configuring for file storage"
  CarrierWave.configure do |config|
    config.permissions = 0666
    config.directory_permissions = 0777
    config.storage = :file
    config.cache_dir = "uploads"
    config.root = Rails.root.join('public')
    config.enable_processing = !Rails.env.test?
  end
end