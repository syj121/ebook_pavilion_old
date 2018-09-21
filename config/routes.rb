Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "background/home#index"

  devise_for :users, controllers: {
          sessions: 'users/sessions',
          registrations: "users/registrations"
        }

  namespace :background do 
    resources :menus
  end

end
