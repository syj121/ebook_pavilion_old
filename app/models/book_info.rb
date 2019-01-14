class BookInfo < ApplicationRecord

  belongs_to :book, optional: true

  mount_uploader :cover, ImageUploader

end
