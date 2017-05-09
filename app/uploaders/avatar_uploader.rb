# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  version :full do
     process :resize_to_fill => [550, 550]
  end

  version :small do 
     process :resize_to_fill => [200, 200]
  end

  version :xsmall do 
    process :resize_to_fill => [100, 100]
  end
    
  if Rails.env == 'development'
    storage :file
   else
    storage :fog
    #storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


end
