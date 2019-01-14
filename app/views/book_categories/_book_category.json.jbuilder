json.extract! book_category, :id, :name, :created_at, :updated_at
json.url book_category_url(book_category, format: :json)
