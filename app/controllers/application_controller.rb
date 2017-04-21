class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  helper_method :agenda
  helper_method :contacto

  def agenda(access_agenda)
  	@agenda = Ntsubproyectosagenda.where(SubProyectoId: access_agenda.SubProyectoId)
  end

  def contacto(id)
  	@contacto = Nccontacto.find_by_ContactoId(id)
  end
end
