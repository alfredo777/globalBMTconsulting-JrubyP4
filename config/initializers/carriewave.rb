CarrierWave.configure do |config|
      config.fog_provider = 'fog/aws'                        # required
      config.fog_credentials = {
        provider:              'AWS',                        # required
        aws_access_key_id:     'AKIAJFRFM6NIKSIJAUXQ',                        # required
        aws_secret_access_key: '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',                        # required
        region:                'us-west-1',                  # optional, defaults to 'us-east-1'
        #host:                  's3.example.com',             # optional, defaults to nil
        #endpoint:              'https://s3.example.com:8080' # optional, defaults to nil
      }
      config.fog_directory  = 'btmconsulting'                          # required
      config.fog_public     = false                                        # optional, defaults to true
      #config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" } # optional, defaults to {}
end


