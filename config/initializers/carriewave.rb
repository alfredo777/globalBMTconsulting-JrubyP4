CarrierWave.configure do |config|
  #if Rails.env == 'production'
    Excon.defaults[:ciphers] = 'DEFAULT'
    config.fog_provider = 'fog/aws' 
    config.fog_credentials = {
      # Configuration for Amazon S3 should be made available through an Environment variable.
      # For local installations, export the env variable through the shell OR
      # if using Passenger, set an Apache environment variable.
      #
      # In Heroku, follow http://devcenter.heroku.com/articles/config-vars
      #
      # $ heroku config:add S3_KEY=AKIAJFRFM6NIKSIJAUXQ S3_SECRET=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 S3_REGION=us-west-1 S3_ASSET_URL=https://btmconsulting-api.herokuapp.com/ S3_BUCKET_NAME=btmconsulting -a btmconsulting-api
   
      # Configuration for Amazon S3
      :provider               => 'AWS',                        # required
      :aws_access_key_id      => 'AKIAJFRFM6NIKSIJAUXQ', #ENV['S3_KEY'],
      :aws_secret_access_key  => '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', #ENV['S3_SECRET'],
      :region                 => 'us-west-1',
      :endpoint               => 'https://s3-us-west-1.amazonaws.com'
      #:host =>                 'agora.rockstars.mx',             # optional, defaults to nil
      #:endpoint =>              'https://agora-shapes-and-forms.s3-website-us-west-1.amazonaws.com' # optional, defaults to nil

    }
   
    # For testing, upload files to local `tmp` folder.
    if Rails.env.development? 
      config.storage = :file
      config.enable_processing = false
      config.root = "#{Rails.root}/tmp"
    else
      config.storage = :fog
    end
   
    config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku
    config.fog_directory  =  'btmconsulting' #ENV['S3_BUCKET_NAME']
    config.fog_public     = false 
    #config.s3_access_policy = :public_read                          # Generate http:// urls. Defaults to :authenticated_read (https://)
    #config.fog_host         = "#{ENV['S3_ASSET_URL']}/#{ENV['S3_BUCKET_NAME']}"
  #end
end