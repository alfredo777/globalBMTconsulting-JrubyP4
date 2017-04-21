class Ntsubproyectosagenda < ActiveRecord::Base
    establish_connection $DB1_CONF ###### se establece la conección a la base de datos systarget2015fruby
	self.table_name = 'NTSubProyectosAgenda'
end