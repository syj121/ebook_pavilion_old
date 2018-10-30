class Role < ApplicationRecord

  has_closure_tree

  scope :usable, -> {where(usable: true)}

end
