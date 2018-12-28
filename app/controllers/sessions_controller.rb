class SessionsController < ApplicationController
    
  def new
  end

  def create
      user = User.find_by(email: params[:session][:email])

      if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          flash[:info] = "Welcome back, #{user.name}！"
          redirect_to user_path(user)
      else
          flash[:danger] = "Ooops! Your email or password was incorrect. Please try again!"
          render 'new'
      end
  end

  def destroy
      session.delete(:user_id)
      redirect_to login_url
  end
  
end
