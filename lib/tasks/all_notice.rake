namespace :notice do
	task :all => :environment do
		######## envia una notificación a todos los dispositovos en la base de datos ###########
    @notice = "Remember to check your appointments in the GBTM Consulting App"
	  @devices = Device.all
	
		#app_android = Rpush::Gcm::App.find_by_name("gbtmproduction")
		#if app_android.nil?
		#	app = Rpush::Gcm::App.new
		#	app.name = "gbtmproduction"
		#	app.auth_key = "Globalbmt2017"
		#	app.connections = 1
		#	app.save!
		#end
		app_ios = Rpush::Apns::App.find_by_name("gbtmproduction")
    if app_ios.nil?
      app_ios = Rpush::Apns::App.new
      app_ios.name = "gbtmproduction"
      app_ios.certificate = File.read("#{Rails.root}/public/certs/push.pem")
      app_ios.environment = "development" # APNs environment.
      app_ios.password = "Globalbmt2017"
      app_ios.connections = 1
      app_ios.save!
    end
    @devices.each do |device|
	    if device.system == "iOS"
	    n = Rpush::Apns::Notification.new
	    n.app = app_ios
	    n.device_token = "#{device.device}" # 64-character hex string
	    n.alert = "#{@notice}"
	    n.data = { foo: :bar }
	    n.sound = "default"
	    n.save!
	    end
    end
    Rpush.push
    Rpush.push
  end

  task :clean => :environment do
   nt =	Rpush::Apns::Notification.all
   puts nt.count
   nt.destroy_all
  end

  task :remove_apps => :environment do 
    app_ios = Rpush::Apns::App.all
    puts app_ios.count
    app_ios.destroy_all
  end 

  task :one_day_notices => :environment do
  	@user_app = UserApp.all
  	@user_app.each do |user_app|
  		@cliente = Nccliente.find_by_Mail(user_app.email)
  		if !@cliente.nil?
	  		puts @cliente.ClienteId
	  		@subproyectos = Ntsubproyecto.where(ClienteId: @cliente.ClienteId)
	  		agenda = []
	  		@subproyectos.each do |sp|
	  			@spr = Ntsubproyectosagenda.where(SubProyectoId: sp.SubProyectoId)
	  			@spr.each do |spr|
	  			agenda.push(spr)
	  		  end
	  		end
        
	  		agenda.each do |junta|
	  			datos_junta = []
	  			@lugar = junta.LugarCita
	  			@hora = junta.FechaCita.strftime('%H:%M')
	  			@dia = junta.FechaCita.strftime('%F')
	  			d = DateTime.now + 1.day
	  			d = d.strftime('%F')
          
          if d == @dia
	  			puts @dia
	  			@contacto = Nccontacto.find_by_ContactoId(junta.ContactoId)
	  			@notice = "You have a meeting tomorrow at #{@hora} hours in #{@lugar} with #{@contacto.ContactoNombre}"
	  			puts @notice
	  			  app_ios = Rpush::Apns::App.find_by_name("gbtmproduction")
	  			  n = Rpush::Apns::Notification.all
	  			  clear =  n.destroy_all
		  			user_app.devices.each do |device|
		  				 if device.system == "iOS"
						    n = Rpush::Apns::Notification.new
						    n.app = app_ios
						    n.device_token = "#{device.device}" # 64-character hex string
						    n.alert = "#{@notice}"
						    n.data = { foo: :bar }
						    n.sound = "default"
						    n.save!
						   end
		  			end
		  			Rpush.push
            Rpush.push
	  	  	end
	  		end
	  	 end
  	end
  end

  task :to_day_notices => :environment do
  	@user_app = UserApp.all
  	@user_app.each do |user_app|
  		@cliente = Nccliente.find_by_Mail(user_app.email)
  		if !@cliente.nil?
	  		puts @cliente.ClienteId
	  		@subproyectos = Ntsubproyecto.where(ClienteId: @cliente.ClienteId)
	  		agenda = []
	  		@subproyectos.each do |sp|
	  			@spr = Ntsubproyectosagenda.where(SubProyectoId: sp.SubProyectoId)
	  			@spr.each do |spr|
	  			agenda.push(spr)
	  		  end
	  		end
        
	  		agenda.each do |junta|
	  			datos_junta = []
	  			@lugar = junta.LugarCita
	  			@hora = junta.FechaCita.strftime('%H:%M')
	  			@dia = junta.FechaCita.strftime('%F')
	  			d = DateTime.now
	  			d = d.strftime('%F')
	  			hourx =  DateTime.now
          hourx = hourx.strftime('%H')


          if d == @dia
          hourx =  DateTime.now
          hourx = hourx.strftime('%H').to_i
          houry = junta.FechaCita.strftime('%H').to_i
          hourz = houry.to_f - hourx.to_f
          puts "#{houry}-#{hourx} = #{hourz}"
          if hourz <= 1 && hourz >= 0
		  			puts @dia
		  			@contacto = Nccontacto.find_by_ContactoId(junta.ContactoId)
		  			@notice = "You have a meeting today at #{@hora} hours in #{@lugar} with #{@contacto.ContactoNombre}"
		  			puts @notice
		  			  app_ios = Rpush::Apns::App.find_by_name("gbtmproduction")
		  			  n = Rpush::Apns::Notification.all
		  			  clear =  n.destroy_all
			  			user_app.devices.each do |device|
			  				 if device.system == "iOS"
							    n = Rpush::Apns::Notification.new
							    n.app = app_ios
							    n.device_token = "#{device.device}" # 64-character hex string
							    n.alert = "#{@notice}"
							    n.data = { foo: :bar }
							    n.sound = "default"
							    n.save!
							   end
			  			end
			  			Rpush.push
	            Rpush.push
	          end
	  	  	end
	  		end
	  	 end
    end
  end

  task :fake_dates => :environment do
  	@user_app = UserApp.all

  	@user_app.each do |user_app|
  		@cliente = Nccliente.find_by_Mail(user_app.email)
	  		if !@cliente.nil?
	  		 @subproyecto = Ntsubproyecto.find_by_ContactoMail("barry@fake.email")
	  		 if @subproyecto.nil?
		  		 @subproyecto =	Ntsubproyecto.new
		  		 @subproyecto.ProyectoId = 10000
		  		 @subproyecto.SubProyectoNombre = "Prueba Fake para APP Mobile #{SecureRandom.hex(4)}"
		  		 @subproyecto.ClienteId = @cliente.ClienteId
		  		 @subproyecto.ContactoNombre = "Barry White"
		  		 @subproyecto.ContactoTelefono = "55555555"
		  		 @subproyecto.ContactoMail = "barry@fake.email"
		  		 @subproyecto.Detalle = "Lorem Ipsum"
		  		 @subproyecto.Objetivos = "Lorem Ipsum"
		  		 @subproyecto.CantidadObjetivo = 2
		  		 @subproyecto.IdiomaFormato = 3
		  		 @subproyecto.UsuarioIdCreador = 10
		  		 @subproyecto.FechaCreacion = DateTime.now
		  		 @subproyecto.UsuarioIdUltMod = 10
		  		 @subproyecto.FechaUltMod = DateTime.now
		  		 @subproyecto.save!
	  		 end
	  		  puts "Subproyecto #{@subproyecto.SubProyectoId}"
	        @contacto = Nccontacto.first
	  		 	puts "Contacto #{@contacto.ContactoId}"
	  		 	@fechacita = DateTime.now + 50.minutes
	  		 	@fechacita = @fechacita.strftime('%FT%T')
	  		 	@lugar = "Hotel Sheraton Maria Isabel Reforma"
	  		 	@agenda =	Ntsubproyectosagenda.new
	  		 	@agenda.SubProyectoId = @subproyecto.SubProyectoId
	  		 	@agenda.AgendaOrden = 2
	  		 	@agenda.ContactoId = @contacto.ContactoId
	  		 	@agenda.Instrucciones = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sit amet nulla finibus, consectetur ex sit amet, vestibulum eros. Duis quis purus eu purus faucibus mattis."
	  		 	@agenda.FechaCita = @fechacita
	  		 	@agenda.LugarCita = @lugar
	  		 	@agenda.LugarCita2 = ""
	  		 	@agenda.LugarCita3 = ""
	  		 	@agenda.LugarCita4 = ""
	  		 	@agenda.Descripcion = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sit amet nulla finibus, consectetur ex sit amet, vestibulum eros. Duis quis purus eu purus faucibus mattis."
	  		 	@agenda.UsuarioIdCreador = 10
	  		 	@agenda.FechaCreacion = DateTime.now
	  		 	@agenda.UsuarioIdUltMod = 10
	  		 	@agenda.FechaUltMod = DateTime.now
	  		 	@agenda.save!
	  		end
	  	end
  	end
 end

