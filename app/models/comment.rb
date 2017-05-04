class Comment < ActiveRecord::Base
   	establish_connection $DB2_CONF ###### se establece la conección a la base de datos interna
   	mount_uploader :attachment, FileUploader

end
