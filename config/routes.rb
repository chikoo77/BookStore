Rails.application.routes.draw do
  devise_for :users, :controllers => {
  	:omniauth_callbacks => "users/omniauth_callbacks"
  }
    resources :books do
      resources :reviews
    end
    root 'books#index'
end
