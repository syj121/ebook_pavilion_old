json.extract! menu, :id, :name, :url, :parent_id, :usable, :description, :created_at, :updated_at
json.url menu_url(menu, format: :json)
