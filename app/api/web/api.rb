module Web
	class Api < Grape::API

		content_type :json, 'application/json;charset=utf-8'
		format :json

		mount Web::V1::TPartial
		mount Web::V1::Home
		mount Web::V1::Menu

	end
end