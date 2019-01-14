Rails.application.routes.draw do
  
  scope "(:locale)", locale: RouteLanguage do
    resources :books
  end
  scope "(:locale)", locale: RouteLanguage do
    resources :book_categories
  end
  scope "(:locale)", locale: RouteLanguage do
    end
  scope "(:locale)", locale: RouteLanguage do
    end
  scope "(:locale)", locale: RouteLanguage do
    resources :roles do 
      member do 
        get :menus
        get :permissions
        post :set_menus
        post :set_permissions
      end
    end
  end
  scope "(:locale)", locale: RouteLanguage do
    resources :menus do 
      collection do 
        get :authority_list
      end
      resources :permissions
    end
  end
  scope "(:locale)", locale: RouteLanguage do
    resources :users
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#index"

  #添加path，不与users路由冲突
  devise_for :users, path: :auth, controllers: {
          sessions: 'user/sessions',
          registrations: "user/registrations"
        }

end
