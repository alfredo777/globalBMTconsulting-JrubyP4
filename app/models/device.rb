class Device < ActiveRecord::Base
	establish_connection $DB2_CONF ###### se establece la conección a la base de datos interna

	belongs_to :user_app
end
