Rails.application.routes.draw do
  if Rails.env.development?
    mount MailPreview => 'mail_view'
  end
  
  ## Rutas para el panel de Administración
  namespace :admin do
    resources :administrators,    only: [:index, :new, :create, :edit, :update, :destroy],  path: "administradores"
    resources :profiles,          only: [:index, :update],                                  path: "perfil"
    resources :sessions,          only: [:new, :create, :destroy],                          path: "sesiones"
  
    # Login y Ruta Inicial
    get '/'              => 'dashboard#index',   as: "root"      # admin_root_url      || admin_root_path
    get 'ingresar'       => 'sessions#new',      as: 'login'     # admin_login_url     || admin_login_path
    get 'salir'          => 'sessions#destroy',  as: 'logout'    # admin_logout_url    || admin_logout_path
  end
  
  ## Rutas para el API
  scope module: :api, default: { format: 'json' } do
  end
  
  ## Rutas para el Front End
  scope module: "front" do
    resources :landings, only: [:index], path: "inicio"
  end
  
  root to: 'front/landings#index'
end