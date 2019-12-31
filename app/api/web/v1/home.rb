module Web
	module V1
		class Home < Grape::API
			#路径添加版本号
			version 'v1', using: :path

			resources :home do

				get "index" do 
					{success: true, message: "欢迎来到云书阁"}
				end

			end

		end
	end
end