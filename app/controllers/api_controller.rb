class ApiController < ApplicationController
  helper_method :check_conection
  helper_method :intent_conection
  skip_before_filter :verify_authenticity_token  


  def index
  session[:admin] = nil
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
             descripccion: ag.Descripcion,
             rating: ag.rating,
             comments: comments(ag.SubProyectoAgendaId)
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
             descripccion: ag.Descripcion,
             rating: ag.rating,
             comments: comments(ag.SubProyectoAgendaId)
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

    no_relative_agenda = no_relative_agenda.sort {|vn1, vn2| vn2[:fecha_cita] <=> vn1[:fecha_cita]}

    render json: {non_relative: no_relative_agenda, agenda_full: agenda }
  end

  def verificador_de_password
    user = UserApp.find_by_email(params[:email])
    puts "#{params[:password]}"
    puts "#{params[:email]}"

    puts params[:device]
    puts params[:name]
    puts params[:cordova]
    puts params[:version]
     
    @pass = Digest::SHA2.hexdigest("#{params[:password]}")
    puts user.password + "(1"
    puts @pass + "(2"
    if user.password.to_s == @pass.to_s
      n = "Usuario Validado"
      active = true
      userz = user
      puts "zzzzz #{user.avatar.xsmall.url}"
      avatar_mini = oppen_images("#{user.avatar.xsmall.url}") 
      avatar_large = oppen_images("#{user.avatar.full.url}")
      device = user.devices.new
      device.device = params[:device].to_s
      device.system = params[:system].to_s
      device.serialx = params[:serialx].to_s
      device.save
      puts ">>>>>>>>>>>>>> #{user.devices.count}"
      puts device
      puts n
      #if device.system == "iOS"
      #send_notice(device.device, "Welcom to BTM #{user.first_name}")
      #end
    else
      n = "Usuario no validado"
      active = false
      userz = ""
      avatar_mini = ""
      avatar_large = ""
      puts n
    end

    render json: {user: user, avatar_mini: avatar_mini, avatar_large: avatar_large , active: active, extracounts: user.have_users_extra_accounts, array_acounts: [user.accounts_array],notice: n}, :callback => params[:callback]
  end

  def create_user_app
  end

  def agregar_un_dispositivo
    @user = UserApp.find(params[:id])
    @device = Device.new
    @device.user_app_id = params[:user_id]
    @device.device = params[:device]
    @device.system = params[:system]
    @device.serialx = params[:serialx]
    @device.save

    if @device.save
      notice = "Dispositivo agregado"
      else
      notice = "Dispositivo no agregado"
    end

    render json: {notice: notice}

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

    avatar_mini = oppen_images("#{user.avatar.xsmall.url}") 
    avatar_large = oppen_images("#{user.avatar.full.url}")

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

     render json: {user: @user, notice: noticex}
  end

  def agregar_comentario
    @comment = Comment.new
    @comment.coment_text = params[:coment_text]
    @comment.attachment = params[:attachment]
    @comment.ntsub_proyectos_agenda_id = params[:id]
    @comment.user_app_id = params[:user_app_id]
    @comment.save

    if @comment.save 
      notice = "Comentario agregado correctamente"
    else
      notice = "No se ha podido agregar el Comentario"
    end
    
    #attachment: get_image(@comment.attachment.url),


    commentx = {
     id: @comment.id,
     coment_text: @comment.coment_text,
     attachment: "http://btmconsulting-api.herokuapp.com/attachment/#{@comment.id}",
     created_at: @comment.created_at
    }

    puts commentx

    render json: {comment: commentx, notice: notice}
  end

  def attachment_in
    @comment = Comment.find(params[:id])
    @url = @comment.attachment.url

  end

  def eliminar_comentario
    @comment = Comment.find(params[:id])
    @comment.destroy


    render json: {notice: "Comentario eliminado"}
  end

  def actualizar_rating
    @rateds = Ntsubproyectosagenda.find(params[:id])
    @rateds.rating = params[:rating]
    @rateds.save
    
    if @rateds.save
      notice = "Actualización completa"
    else
      notice = "Actualizaión incompleta"
    end
    render json: {rate: @rateds.rating, notice: notice}
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
      url = Base64.encode64(open(urlx).to_a.join)
    end

    url
  end
end
