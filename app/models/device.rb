class Device < ActiveRecord::Base
	establish_connection $DB2_CONF ###### se establece la conección a la base de datos interna

	belongs_to :user_app

	validates_uniqueness_of :device, scope: :user_app_id

end
