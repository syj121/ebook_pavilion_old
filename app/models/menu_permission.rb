class MenuPermission < ApplicationRecord
  belongs_to :menu
  has_many :menu_permission_items
end