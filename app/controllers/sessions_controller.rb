class SessionsController < ApplicationController
  def new
  end
  
  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		signin(user)
  		redirect_to posts_path
  	else	
  		render 'new'
  	end	
  end
  
  def destroy
  	signout
  	redirect_to posts_path
  end
  
end
