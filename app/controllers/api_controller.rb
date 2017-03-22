class ApiController < ApplicationController
  helper_method :check_conection
  helper_method :intent_conection


  def index
  	check_conection
  	@n = Nccliente.all
  	@n.each do |c|
  	  	puts " #{c.ClienteId} | #{c.ClienteNombre} | #{c.SucursalId} | #{c.Mail} "
  	end

    #####

    @u = UserApp.count
    puts "Contador #{@u}"
  end


  def check_conection
  	conection = ActiveRecord::Base.connected?

	if conection
		puts "La base de datos esta actualmente conectada " + "#{conection}"
		puts "******* tables ************"
		#puts  ActiveRecord::Base.connection.tables
	else
	    puts "La base de datos no ha podido conectarse " + "#{conection}"
	    intent_conection
	    
	end
  end

  def intent_conection
   @connection = ActiveRecord::Base.establish_connection(:adapter  => "jdbcmssql", :url => "jdbc:jtds:sqlserver://107.191.55.96:1433;DatabaseName=Systarget2015", :username=>'SysTarget2015Usr', :password => 'systarget2015systarget') 
   puts @connection
   @base = ActiveRecord::Base.connection.current_database
   puts @base
   puts "******* tables ************"
   puts  ActiveRecord::Base.connection.tables
  end
end
