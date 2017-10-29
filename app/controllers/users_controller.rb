class UsersController < ApplicationController
  # before_action :require_logged_in, only: [:show]
  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    return nil if @user.nil?
    if @user.save
      login!(@user)
      redirect_to bands_url
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = current_user
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
