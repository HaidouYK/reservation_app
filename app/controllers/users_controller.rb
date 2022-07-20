class UsersController < ApplicationController
  def account
  end

  def profile
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to request.referer, notice: "Profile was successfully updated."
    else
      render :profile
    end
  end

  private
    def user_params
      params.require(:user).permit(:user_name, :user_profile, :avatar).merge(id: current_user.id)
    end
end
