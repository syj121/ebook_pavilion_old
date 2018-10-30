class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  include Common
  include SoftDelete
end
