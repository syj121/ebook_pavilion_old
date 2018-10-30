class Role < ApplicationRecord

  has_closure_tree


  include Common
  include SoftDelete

  scope :usable, -> {where(usable: true)}

end
