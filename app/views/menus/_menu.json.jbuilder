json.extract! menu, :id, :name, :url, :usable, :parent_id, :description, :created_at, :updated_at
json.url menu_url(menu, format: :json)
