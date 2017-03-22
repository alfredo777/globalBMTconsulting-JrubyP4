Rails.application.routes.draw do
  get 'admin/login'

  get 'admin/users'

  get 'admin/calendar_table'

  get 'admin/open_event'

  root 'api#index'


end
