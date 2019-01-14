class BookCategory < ApplicationRecord

  has_one :info,  :dependent => :destroy, class_name: "BookCategoryInfo"
  accepts_nested_attributes_for :info, :allow_destroy => true

end
