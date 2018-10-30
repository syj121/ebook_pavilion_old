class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable
         #, :recoverable, :rememberable, :trackable, :validatable

  before_create :set_default_password



  #新增用户，默认密码
  def set_default_password
    self.password = "12345678"
    self.password_confirmation = "12345678"
  end
end