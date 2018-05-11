class UsersController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    @user.update(user_prams)
  end

  def destroy
    @user.destroy
    redirect_to root
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :birthday, :gender, :phone, :language, :currency, :address, :introduction)
  end

end
