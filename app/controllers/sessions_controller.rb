class SessionsController < ApplicationController
  def new
  end

 def create
 	user = User.find_by(email: params[:session][:email].downcase)
 	if user && user.authenticate(params[:session][:password])
 		flash.now[:success] = "Welcome to dashboard!!"
	 	render 'show'
	else
		flash.now[:error] = "Invalid credentials!! Login again"
		render 'new'
		
	end
 end
  def destroy
  end
end
