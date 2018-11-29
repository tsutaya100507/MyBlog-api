CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['AWS_S3_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_S3_SECRET_ACCESS_KEY'],
    region:                'ap-northeast-1',
  }

  # 公開・非公開の切り替え
  config.fog_public     = true
  # キャッシュの保存期間
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }

  # キャッシュをS3に保存
  # config.cache_storage = :fog

  # 環境ごとにS3のバケットを指定
  case Rails.env
    when 'production'
      config.fog_directory = 'tatsuyaichikawa-blog-images'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/tatsuyaichikawa-blog-images'

    when 'development'
      config.fog_directory = 'tatsuyaichikawa-blog-images'
      config.fog_public     = false
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/tatsuyaichikawa-blog-images'
      config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
    when 'test'
      config.fog_directory = 'tatsuyaichikawa-blog-images'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/tatsuyaichikawa-blog-images'
  end
end

# 日本語ファイル名の設定
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/