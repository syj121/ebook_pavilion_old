class Menu < ApplicationRecord

  has_many :menu_permissions
  accepts_nested_attributes_for :menu_permissions
  has_many :menu_permission_items

  has_closure_tree    

end
