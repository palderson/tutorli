CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'aws_access_key_id',       # required
    :aws_secret_access_key  => 'aws_secret_access_key'
  }
  config.fog_directory  = 'video_file' # required
end
