Rails.application.routes.draw do
  
  resources :menus
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#index"

  devise_for :users, controllers: {
          sessions: 'users/sessions',
          registrations: "users/registrations"
        }

end
