class ApiController < ApplicationController
  helper_method :check_conection
  helper_method :intent_conection
  skip_before_filter :verify_authenticity_token  


  def index

  end


  def agenda_usuario
    @cliente = Nccliente.find_by_Mail(params[:Mail])
    @subproyectos = Ntsubproyecto.where(ClienteId: @cliente.ClienteId)
    @proyectos = Ntproyecto.where(ClienteId: @cliente.ClienteId)
  end

  def agenda_usuario_json
    @cliente = Nccliente.find_by_Mail(params[:Mail])
    @subproyectos = Ntsubproyecto.where(ClienteId: @cliente.ClienteId)
    @proyectos = Ntproyecto.where(ClienteId: @cliente.ClienteId)


    sp_to_json = []

    no_relative_agenda = []

    @subproyectos.each do |sp|
      @ag = agenda(sp) 

      agenda_edited = []

      @ag.each do |ag|

      cc = contacto(ag.ContactoId)
      agenda_edited.push({
             id: ag.SubProyectoAgendaId,
             orden: ag.AgendaOrden,
             contacto_id: cc.ContactoId,
             contacto_nombre: cc.ContactoNombre,
             contacto_telefono: cc.Telefono, 
             contacto_cargo: cc.Cargo,
             contacto_empresa: cc.Empresa,
             contacto_mail: cc.Mail,
             instrucciones: ag.Instrucciones,
             fecha_cita: ag.FechaCita,
             lugar_cita: ag.LugarCita,
             lugar_cita_2: ag.LugarCita2,
             lugar_cita_3: ag.LugarCita3,
             lugar_cita_4: ag.LugarCita4,
             descripccion: ag.Descripcion
             })
      no_relative_agenda.push({
             id: ag.SubProyectoAgendaId,
             orden: ag.AgendaOrden,
             contacto_id: cc.ContactoId,
             contacto_nombre: cc.ContactoNombre,
             contacto_telefono: cc.Telefono, 
             contacto_cargo: cc.Cargo,
             contacto_empresa: cc.Empresa,
             contacto_mail: cc.Mail,
             instrucciones: ag.Instrucciones,
             fecha_cita: ag.FechaCita,
             lugar_cita: ag.LugarCita,
             lugar_cita_2: ag.LugarCita2,
             lugar_cita_3: ag.LugarCita3,
             lugar_cita_4: ag.LugarCita4,
             descripccion: ag.Descripcion
             })
      end


      sp_to_json.push({
          id: sp.SubProyectoId,
          nombre: sp.SubProyectoNombre, 
          contacto_nombre: sp.ContactoNombre, 
          contacto_telefono: sp.ContactoTelefono, 
          contacto_email: sp.ContactoMail, 
          detalle: sp.Detalle, 
          objetivos: sp.Objetivos,
          agenda: agenda_edited
          })
    end

    agenda = {
      perfil: @cliente.Perfil,
      nombre: @cliente.ClienteNombre,
      directo: @cliente.EsDirecto,
      Tel1: @cliente.Telefono1,
      Tel2: @cliente.Telefono2,
      Email: @cliente.Mail,
      subproyectos: sp_to_json

    }


    render json: {non_relative: no_relative_agenda, agenda_full: agenda }
  end

  def verificador_de_password
    user = UserApp.find_by_email(params[:email])
    puts "#{params[:password]}"
    puts "#{params[:email]}"
     
    @pass = Digest::SHA2.hexdigest("#{params[:password]}")
    puts user.password + "(1"
    puts @pass + "(2"
    if user.password.to_s == @pass.to_s
      n = "Usuario Validado"
      active = true
      userz = user
      avatar_mini = oppen_images(user.avatar.xsmall.url) 
      avatar_large = oppen_images(user.avatar.full.url)
      #puts n
      #puts avatar_mini
      #puts avatar_large
    else
      n = "Usuario no validado"
      active = false
      userz = ""
      avatar_mini = ""
      avatar_large = ""
      puts n
    end
    

    render json: {user: user, avatar_mini: avatar_mini, avatar_large: avatar_large , active: active, notice: n}, :callback => params[:callback]
  end

  def create_user_app

  end

  def actualizar_avatar
    user = UserApp.find(params[:id])
    user.avatar = params[:file]
    user.save

    if user.save
      noticex = "Avatar cargado correctamente"
    else
      noticex = "El avatar no fue agregaco"
    end

    avatar_mini = oppen_images(user.avatar.xsmall.url) 
    avatar_large = oppen_images(user.avatar.full.url)

    render json: {notice: noticex, avatar_mini: avatar_mini, avatar_large: avatar_large}
  end

  def actualizar_usuario
     @user = UserApp.find_by_email(params[:email]) 
     @user.first_name = params[:first_name] if !params[:first_name].nil?
     @user.last_name = params[:last_name] if !params[:last_name].nil?
     @user.linkedin = params[:linkedin] if !params[:linkedin].nil?
     @user.save

     #if params[:password] != ''
     #puts "password modify"
     #@user.password = Digest::SHA2.hexdigest("#{params[:password]}")
     #end

     if @user.save
       noticex = "Usuario actualizado correctamente"
       else
       noticex = "El usuario no se ha podido actualizar"
     end

     render json: {user: @user.to_json, notice: noticex}, :callback => params[:callback]
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
