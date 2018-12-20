class SessionsController < ApplicationController
  #before_action :require_no_user! only: %i(create new)

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    
    if @user.nil?
      flash.now[:errors] = ["Incorrect email or password"]
      render :new
    else
      login_user!(@user)
      redirect_to users_url
    end
  end
  
  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil

    redirect_to new_session_url
  end


end