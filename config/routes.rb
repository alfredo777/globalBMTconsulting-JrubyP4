Rails.application.routes.draw do
  get 'admin', to: 'admin#history', as: :admin

  get 'create_user', to: 'admin#create_user', as: :create_user

  get 'admin/newest_user', as: :newest_user
  post  'admin/newest_user'

  get 'admin/edit_user', as: :edit_user

  get 'admin/update_user', as: :update_user
  post 'admin/update_user'

  get 'admin/destroy_user', as: :destroy_user
  post 'admin/destroy_user'
 
  get 'admin/login', as: :login
  post 'admin/login'

  get 'admin/validate', as: :validate
  post 'admin/validate'

  get 'admin/users', as: :users

  get 'admin/admins',as: :admins

  get 'admin/new_admin', as: :new_admin

  get 'admin/create_admin', as: :create_admin
  post 'admin/create_admin'

  get 'admin/admin_update', as: :admin_update
  post 'admin/admin_update'

  get 'admin/update_admin', as: :update_admin
  post 'admin/update_admin'

  get 'admin/destroy_admin', as: :destroy_admin
  post 'admin/destroy_admin'

  get 'admin/log_out', as: :log_out
  post 'admin/log_out'

  get 'admin/calendar_table'

  get 'admin/open_event'

  root 'api#index'

  get 'agenda_usuario', to: 'api#agenda_usuario', as: :agenda_usuario

  get 'attachment/:id', to: 'api#attachment_in', as: :attachment

  get 'agenda_usuario_json', to: 'api#agenda_usuario_json', as: :agenda_usuario_json

  get 'verificador_de_password', to: 'api#verificador_de_password', as: :verificador_de_password
  post 'verificador_de_password', to: 'api#verificador_de_password'

  get 'actualizar_avatar', to: 'api#actualizar_avatar', as: :actualizar_avatar
  post 'actualizar_avatar', to: 'api#actualizar_avatar'

  get 'actualizar_usuario', to: 'api#actualizar_usuario', as: :actualizar_usuario
  post 'actualizar_usuario', to: 'api#actualizar_usuario'

  get 'agregar_comentario', to: 'api#agregar_comentario', as: :agregar_comentario
  post 'agregar_comentario', to: 'api#agregar_comentario'

  get 'eliminar_comentario', to: 'api#eliminar_comentario', as: :eliminar_comentario
  post 'eliminar_comentario', to: 'api#eliminar_comentario'

  get 'actualizar_rating', to: 'api#actualizar_rating', as: :actualizar_rating
  post 'actualizar_rating', to: 'api#actualizar_rating'

  get 'agregar_un_dispositivo', to: 'api#agregar_un_dispositivo', as: :agregar_un_dispositivo
  post 'agregar_un_dispositivo', to: 'api#agregar_un_dispositivo'

end
