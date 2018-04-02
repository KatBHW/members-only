class User < ApplicationRecord

	before_save { email.downcase! }
	validates :name, presence: true
  validates :email, presence: true
  has_secure_password
  
end
