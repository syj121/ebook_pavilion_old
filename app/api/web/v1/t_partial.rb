module Web
  module V1
    class TPartial < Grape::API
      #路径添加版本号
      version 'v1', using: :path

      resources :t_partials do

        get "menus" do 
          menus = ::Menu.select(:id, :name, :url, :parent_id).order(parent_id: :asc)
          {success: true, message: "获取成功", menus: menus}
        end

      end

    end
  end
end