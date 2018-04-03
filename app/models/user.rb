class User < ApplicationRecord
	
	has_many :posts
	 
	before_create :create_remember_token
	before_save { email.downcase! }
	
	validates :name, presence: true
  validates :email, presence: true
  has_secure_password
  
  private
  
   # Create a remember token
  def User.new_token
  	SecureRandom.urlsafe_base64
  end
  
  # Encrypt the token
  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
	# Save the encrypted token
  def create_remember_token
  	self.remember_digest = User.digest(User.new_token)
  end
  
end
