class RoomsController < ApplicationController
  before_action :authenticate_user!, except: %i(index)
  before_action :set_new_room, only: %i(create)
  before_action :set_room, only: %i(show destroy)

  def index
    @rooms = Room.order('created_at DESC').page(params[:page]).per(8)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @room = Room.new
    @room.build_amenity
    @room.room_images.build
    @room.build_house_rule
  end

  def create
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    if current_user.id == @room.user_id
      @room.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def set_new_room
    @room = Room.new(room_params)
    @room.build_amenity
    @room.room_images.build
    @room.build_house_rule
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
                                 :title,
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
                                                         :content_cache],
                                 house_rule_attributes:[:id,
                                                        :children,
                                                        :infants,
                                                        :pets,
                                                        :smoking,
                                                        :events,
                                                        :other_rules,
                                                        :must_climb_stairs,
                                                        :potential_for_noise,
                                                        :pets_live_on_property,
                                                        :no_parking_on_property,
                                                        :some_spaces_are_shared,
                                                        :amenity_limitations,
                                                        :surveillance_or_recording_devices_on_property,
                                                        :weapons_on_property,
                                                        :dangerous_animals_on_property,
                                                        :other_notice,
                                                        :room_id]
                                ).merge(user_id: current_user.id)
  end
end
