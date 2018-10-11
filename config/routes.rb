Rails.application.routes.draw do
  
  scope "(:locale)", locale: /en|zh-CN/ do
    resources :menus
  end
  scope "(:locale)", locale: RouteLanguage do
    resources :menus
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#index"

  devise_for :users, controllers: {
          sessions: 'users/sessions',
          registrations: "users/registrations"
        }

end
