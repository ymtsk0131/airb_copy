class RoomsController < ApplicationController

  def index
  end

  def new
    @room = Room.new
    @room.build_amenity
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
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
                                                     :room_id]
                                ).merge(user_id: current_user.id)
  end
end
