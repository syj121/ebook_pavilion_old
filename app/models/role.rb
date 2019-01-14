class Role < ApplicationRecord

  has_closure_tree

  has_and_belongs_to_many :menus
  accepts_nested_attributes_for :menus, :allow_destroy => true, :reject_if => :all_blank    #如果都是空的，就不建立

  scope :usable, -> {where(usable: true)}

end
