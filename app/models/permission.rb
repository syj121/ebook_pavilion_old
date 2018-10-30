class Permission < ApplicationRecord
  belongs_to :menu


  include Common
  include SoftDelete

end
