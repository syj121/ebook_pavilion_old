Rails.application.routes.draw do
  
  scope "(:locale)", locale: RouteLanguage do
    resources :roles
  end
  scope "(:locale)", locale: RouteLanguage do
    resources :menus do 
      resources :permissions
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#index"

  devise_for :users, controllers: {
          sessions: 'users/sessions',
          registrations: "users/registrations"
        }

end
