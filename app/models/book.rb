class Book < ApplicationRecord
  belongs_to :book_category

  has_one :info,  :dependent => :destroy, class_name: "BookInfo"
  accepts_nested_attributes_for :info, :allow_destroy => true
end
