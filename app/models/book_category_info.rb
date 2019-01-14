class BookCategoryInfo < ApplicationRecord

  belongs_to :book_category, optional: true

  mount_uploader :cover, ImageUploader

end
