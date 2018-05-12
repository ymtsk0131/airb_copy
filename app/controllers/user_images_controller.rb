class UserImagesController < ApplicationController
  def new
    @image = UserImage.new
  end

  def create
    UserImage.create(content: image_params[:content], user_id: current_user.id)
  end

  def destroy
  end

  private
  def image_params
    params.require(:user_image).permit(:content)
  end
end
