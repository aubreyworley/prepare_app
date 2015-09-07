class User < ActiveRecord::Base
  has_secure_password

  has_many :checkins, dependent: :destroy
  has_many :contacts, dependent: :destroy

end
