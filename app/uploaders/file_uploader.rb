class FileUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick
    
  if Rails.env == 'development'
    storage :fog
   else
    storage :fog
    #storage :file
  end
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end


end
