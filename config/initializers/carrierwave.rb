require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
    config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: 'AKIASQY3LDVFLVOD6M5I',
        aws_secret_access_key: '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',
        region: 'ap-northeast-1',  # Tokyoの場合
    }
    config.cache_storage = :fog # キャッシュにS3を指定

    # 環境毎にバケットを分けます
    case Rails.env
    when 'production'
        config.fog_directory  = 'psychologyapp'
    when 'development'
        config.storage :fog
        config.fog_provider = 'fog/aws'
        config.fog_directory  = 'psychologyapp'
        config.asset_host = 'https://s3.amazonaws.com/psychologyapp'
        # NOTE: AWS側の設定を変えなくても、この１行の設定でアップロードできた
        config.fog_public = false # ←コレ
    when 'test'
        config.fog_directory  = 'psychologyapp'
    end
end
