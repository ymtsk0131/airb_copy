class UserImagesController < ApplicationController
  def new
    @image = UserImage.new
    @images = current_user.user_images
  end

  def create
    if UserImage.create(content: image_params[:content], user_id: current_user.id)
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
    params.require(:user_image).permit(:content)
  end
end
