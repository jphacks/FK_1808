class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      redirect_to root_path
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:username)
  end
end
