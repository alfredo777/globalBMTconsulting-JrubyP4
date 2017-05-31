class AdminController < ApplicationController
  before_filter :admin_loggin, except: [:login, :validate]
  def history
  	@users = UserApp.last(10)
    @admins = AdminUser.last(10)
  end

  def create_user
    @nccliente =  Nccliente.all

  end

  def newest_user
  	 @user = UserApp.new
  	 @user.first_name = params[:first_name] 
  	 @user.last_name = params[:last_name] 
  	 @user.linkedin = params[:linkedin] 
  	 @user.presentation_card_front = params[:presentation_card_front]
  	 @user.presentation_card_behind = params[:presentation_card_behind]
  	 @user.password = Digest::SHA2.hexdigest("#{params[:password]}")
  	 @user.avatar = params[:avatar]
  	 @user.bussines_avatar = params[:bussines_avatar]
  	 @user.email = params[:email]
     @user.accounts_array = params[:accounts_array]
     if params[:accounts_array] != ''
      @user.have_users_extra_accounts = true
     end
  	 @user.salt = SecureRandom.hex(32)
  	 @user.save

     redirect_to :back
  end

  def destroy_user
  	@user = UserApp.find(params[:id])
  	@user.destroy

  	flash[:notice] = "El usuario ha sido eliminado"
  	redirect_to :back
  end

  def edit_user
  	@user = UserApp.find(params[:id])
  end

  def update_user
     @user = UserApp.find(params[:id]) 
  	 @user.first_name = params[:first_name] if !params[:first_name].nil?
  	 @user.last_name = params[:last_name] if !params[:last_name].nil?
  	 @user.linkedin = params[:linkedin] if !params[:linkedin].nil?
  	 @user.presentation_card_front = params[:presentation_card_front] if !params[:presentation_card_front].nil?
  	 @user.presentation_card_behind = params[:presentation_card_behind] if !params[:presentation_card_behind].nil?
     puts "<<<<<<<<<<<<<<#{params[:password]}"
     if params[:password] != ''
     puts "password modify"
  	 @user.password = Digest::SHA2.hexdigest("#{params[:password]}")
     end
     @user.accounts_array = params[:accounts_array]
     if params[:accounts_array] != ''
      @user.have_users_extra_accounts = true
     end
  	 @user.avatar = params[:avatar] if !params[:avatar].nil?
  	 @user.bussines_avatar = params[:bussines_avatar] if !params[:bussines_avatar].nil?
  	 @user.email = params[:email] if !params[:email].nil?
  	 @user.save

  	 redirect_to users_path
  end

  def login
  end

  def log_out
    session[:admin] = nil
    redirect_to root_path
  end

  def validate
    @admin = AdminUser.find_by_email(params[:email])

    passx = @admin.salt + "#{params[:password]}"

    @pass = Digest::SHA2.hexdigest(passx) 
    puts "#{@admin.password} === #{@pass}"
     
    if @admin.password.to_s == @pass.to_s
      session[:admin] = @admin.id
      flash[:notice] = "Ingreso correcto"
      redirect_to admin_path
    else
      session[:admin] = nil
      flash[:notice] = "Usuario Invalido"
      redirect_to root_path
    end

  end

  def admins
    @admins = AdminUser.all
  end

  def new_admin
  end

  def create_admin
    @admin = AdminUser.new

    salt = SecureRandom.hex(10)

    passx = "#{salt}" + "#{params[:password]}"

    @admin.salt = salt
    @admin.password = Digest::SHA2.hexdigest("#{passx}")
    @admin.email = params[:email]
    @admin.name = params[:name]
    @admin.save

    if @admin.save
      flash[:notice] = "Admnistrador creado"
      redirect_to admins_path
    else
      flash[:notice] = "El admnistrador no ha sido creado"
      redirect_to :back
    end
  end

  def admin_update
    @admin = AdminUser.find(params[:id])
  end

  def update_admin
    @admin = AdminUser.find(params[:id])
    salt = SecureRandom.hex(10)
    passx = "#{salt}" + "#{params[:password]}"
    @admin.email = params[:email]
    if params[:password] != ''
    @admin.password = passx
    @admin.salt = salt
    end
    @admin.name = params[:name]
    @admin.save

    flash[:notice] = "El admnistrador no ha actualizado"
    redirect_to admins_path
  end

  def destroy_admin
    @admin = AdminUser.find(params[:id])
    @admin.destroy

    flash[:notice] = "Se elimina el administrador"

    redirect_to admins_path
  end

  def admin_loggin
    if session[:admin] == nil
      flash[:notice] = "Ingreso no permitido"
      redirect_to login_path
    end
  end

  def users
  	@users = UserApp.paginate(:page => params[:page], :per_page => 3)
  end

  def calendar_table
  end

  def open_event
  end
end
