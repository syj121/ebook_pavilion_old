class Menu < ApplicationRecord

  has_many :permissions

  has_closure_tree

  
end
