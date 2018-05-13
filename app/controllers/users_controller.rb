class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    if @user.update(user_params)
      redirect_to root
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to root
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname, :birthday, :gender, :phone, :language, :currency, :address, :introduction)
  end

end
