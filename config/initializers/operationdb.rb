conection = ActiveRecord::Base.connected?

if conection
	puts "La base de datos esta actualmente conectada " + "#{conection}"
else
    puts "La base de datos no ha podido conectarse " + "#{conection}"
end