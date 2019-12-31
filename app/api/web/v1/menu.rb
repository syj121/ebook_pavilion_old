module Web
	module V1
		class Menu < Grape::API
			#路径添加版本号
			version 'v1', using: :path

			resources :menus do

				get "list" do 
					menus = ::Menu.select(:id, :name, :url, :usable).map { |menu| {
						id: menu.id,
						name: menu.name,
						url: menu.url,
						usable: menu.usable
					} }
					{success: true, message: "获取成功", menus: menus}
				end

			end

		end
	end
end