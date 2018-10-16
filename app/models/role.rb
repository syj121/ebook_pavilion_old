class Role < ApplicationRecord

  has_closure_tree


  include Common

  scope :usable, -> {where(usable: true)}

end
