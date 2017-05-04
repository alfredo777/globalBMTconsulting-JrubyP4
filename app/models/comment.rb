class Comment < ActiveRecord::Base
   	establish_connection $DB2_CONF ###### se establece la conección a la base de datos interna
   	mount_uploader :attachment, FileUploader
    
   	def datafile
   		@data = oppen_images(self.attachment.url) 
   	end

    def oppen_images(urlx)
    if urlx.nil?
      url = nil
      else
      if Rails.env == 'production'
      filename ||= "#{Rails.root}/public#{urlx}"
      #filename ||= "#{urlx}"
      else
      filename ||= "#{Rails.root}/public#{urlx}"
      end
      #url = File.binread(filename)
      #binary = url.unpack('B*')
      #binary = binary[0]
      #url = Base64.encode64(url)
      url = Base64.encode64(open(filename).to_a.join)
    end
    url
   end
end
