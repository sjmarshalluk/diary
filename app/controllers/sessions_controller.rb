class SessionsController < ApplicationController
  def new
  end

  def create

  	@email = params[:session][:email]
  	@password = params[:session][:password]


  	@user = User.find_by(email: @email)


  	if @user.present? and @user.authenticate(@password)
  		flash[:success] = "Welcome back #{@user.email}"
  		session[:user_id] = @user.id
  		redirect_to root_path
  	else
  		flash[:error] = "Try again"
  		render :new  		
  	end
  end


  def destroy
  	reset_session
  	flash[:success] = "You have logged out"
  	redirect_to root_path
  end
end
