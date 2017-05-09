class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  helper_method :agenda
  helper_method :contacto
  helper_method :comments
  helper_method :get_image
  #phonegap push --deviceID 4fc636651f92262bf08bc92cdf6a13e5ae9c191d150ae6ddb65e6af8b8419656 --service apns --payload '{ "aps": { "alert": "Hello World" } }'
  #phonegap push --deviceID 4fc636651f92262bf08bc92cdf6a13e5ae9c191d150ae6ddb65e6af8b8419656 --service gcm --payload '{ "data": { "title": "Hello", "message": "World"} }'
  def agenda(access_agenda)
  	@agenda = Ntsubproyectosagenda.where(SubProyectoId: access_agenda.SubProyectoId)
  end

  def contacto(id)
  	@contacto = Nccontacto.find_by_ContactoId(id)
  end

  def comments(id)
    comments = Comment.where(ntsub_proyectos_agenda_id: id)
    puts "#{comments.count} --- comentarios"
    array_comments = []
    comments.each do |c|
      array_comments.push({
         id: c.id,
         coment_text: c.coment_text,
         attachment: get_image(c.attachment.url),
         created_at: c.created_at
        })
    end
    array_comments
  end

  def get_image(urlx)
    if urlx.nil?
      url = nil
      else
      if Rails.env == 'production'
      filename ||= "https://btmconsulting-api.herokuapp.com/#{urlx}"

      #filename ||= "#{urlx}"
      else
      filename ||= "http://192.168.1.75:3000/#{urlx}"

      end
     
      url = filename
    end
    url
  end


end
