class RoomsController < ApplicationController
  before_action :authenticate_user!, except: %i(index)
  before_action :set_new_room, only: %i(create)
  before_action :set_room, only: %i(show edit update)

  def index
  end

  def new
    @room = Room.new
    @room.build_amenity
  end

  def show
  end

  def create
    if @room.save
      redirect_to @room
    else
      render :new
    end
  end

  def edit
    @images = @room.room_images
    @images.build
    @status = params[:status]
  end

  def update
    if params[:flag2]
      session[:flag2] = "on"
    end
    if @room.user_id == current_user.id
      @room.update(room_params)
      redirect_to @room
    end
  end

  private

  def set_new_room
    @room = Room.new(room_params)
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:category,
                                 :property_type,
                                 :room_type,
                                 :occupied,
                                 :capacity,
                                 :bedrooms,
                                 :beds,
                                 :bathrooms,
                                 :bathroom_private,
                                 :location,
                                 :summary,
                                 :family,
                                 :group,
                                 :pets,
                                 :other,
                                 :reservation_deadline,
                                 :check_in_from,
                                 :check_in_to,
                                 :min_stay,
                                 :max_stay,
                                 :base_price,
                                 :status,
                                 amenity_attributes:[:essentials,
                                                     :wifi,
                                                     :shampoo,
                                                     :closet,
                                                     :tv,
                                                     :heat,
                                                     :air_condditioner,
                                                     :breakfast,
                                                     :workspace,
                                                     :fireplace,
                                                     :iron,
                                                     :hair_dryer,
                                                     :animals,
                                                     :private_entrance,
                                                     :smoke_detector,
                                                     :carbon_monoxide_detector,
                                                     :first_aid_kit,
                                                     :safety_card,
                                                     :fire_extinguisher,
                                                     :bedroom_lock,
                                                     :private_livingroom,
                                                     :pool,
                                                     :kitchen,
                                                     :laundry_washer,
                                                     :laundry_dryer,
                                                     :parking,
                                                     :elevator,
                                                     :hot_tub,
                                                     :gym,
                                                     :room_id],
                                 room_images_attributes:[:id,
                                                         :content,
                                                         :status,
                                                         :room_id,
                                                         :content_cache]
                                ).merge(user_id: current_user.id)
  end
end
