class SessionsController < ApplicationController
  # before_action :require_logged_in, only: [:destroy]
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )
    if user.nil?
      flash.now[:errors] = ["bad login"]
      render :new
    else
      login!(user)
      redirect_to user
    end
  end

  #show current user
  def show
    # current_user
    # fail

    redirect_to current_user
  end

  def destroy
    #not getting here
    logout!
    redirect_to new_session_url
  end
end
