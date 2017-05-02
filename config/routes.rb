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
 
  get 'admin/login'

  get 'admin/users', as: :users

  get 'admin/calendar_table'

  get 'admin/open_event'

  root 'api#index'

  get 'agenda_usuario', to: 'api#agenda_usuario', as: :agenda_usuario

  get 'agenda_usuario_json', to: 'api#agenda_usuario_json', as: :agenda_usuario_json

  get 'verificador_de_password', to: 'api#verificador_de_password', as: :verificador_de_password
  post 'verificador_de_password', to: 'api#verificador_de_password'

  get 'actualizar_avatar', to: 'api#actualizar_avatar', as: :actualizar_avatar
  post 'actualizar_avatar', to: 'api#actualizar_avatar'

  get 'actualizar_usuario', to: 'api#actualizar_usuario', as: :actualizar_usuario
  post 'actualizar_usuario', to: 'api#actualizar_usuario'

end
