class AdminController < ApplicationController

  def history
  	@users = UserApp.last(10)
  end

  def create_user
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

  	 @user.avatar = params[:avatar] if !params[:avatar].nil?
  	 @user.bussines_avatar = params[:bussines_avatar] if !params[:bussines_avatar].nil?
  	 @user.email = params[:email] if !params[:email].nil?
  	 @user.save

  	 redirect_to users_path
  end

  def login
  end

  def users
  	@users = UserApp.paginate(:page => params[:page], :per_page => 3)
  end

  def calendar_table
  end

  def open_event
  end
end
