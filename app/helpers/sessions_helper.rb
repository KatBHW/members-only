module SessionsHelper

def signin(user)
		remember_token = User.new_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_digest, User.digest(remember_token))
		self.current_user = user
	end
	
	def current_user
	  @current_user ||= User.find_by(remember_digest: User.digest(cookies[:remember_token]))
	end
	
	def current_user=(user)
		@current_user = user
	end
	
	def signed_in?
		!current_user.nil?
	end
	
	def require_signin
		unless signed_in?
			redirect_to signin_path
		end
	end
	
	def signout
		cookies.delete(:remember_token)
		self.current_user = nil
	end
	
end
