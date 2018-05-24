class UserImagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @image = UserImage.new
    @images = current_user.user_images
  end

  def create
    image = UserImage.new(image_params)
    if image.save
      redirect_to new_user_image_url
    else
      render :new
    end
  end

  def destroy
    image = UserImage.find(params[:id])
    if image.destroy
      redirect_to new_user_image_url
    else
      render :new
    end
  end

  private
  def image_params
    params.require(:user_image).permit(:content, :user_id)
  end
end
