require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production? || Rails.env.development?
  CarrierWave.configure do |config|
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory = 'psychology-app'
    config.asset_host = 'https://s3.amazonaws.com/psychology-app'
    # NOTE: AWS側の設定を変えなくても、この１行の設定でアップロードできた
    config.fog_public = false # ←コレ
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AWS_ACCESS_KEY2'],
      aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY2'],
      region: ENV['AWS_REGION2']  # Tokyoの場合
    }
    config.cache_storage = :fog # キャッシュにS3を指定
  end
else
  CarrierWave.configure do |config|
    config.storage :file
  end
end
