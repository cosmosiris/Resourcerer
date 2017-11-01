class SessionsController < ApplicationController
  include SessionsHelper

  def create
    @user = User.find_by_email(session_params[:email])
       if @user && @user.authenticate(session_params[:password])
         login(@user)
         redirect_to resources_path
       else
         @errors = ["Wrong email or password"]
         render :'sessions/new'
       end
  end

  def new
  end

  def logout
    session[:id]= nil
    redirect_to '/'
  end

  def session_params
    params.permit(:email, :password)
  end
end