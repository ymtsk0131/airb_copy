class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: %i(new create)

  def new
  end

  def create
    @reservation = @room.reservations.new(reservation_params)
    if @reservation.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def set_room
    @room = Room.find(params[:room_id])
  end

  def reservation_params
    params.require(:reservation).permit(:date, :guests, :room_id).merge(user_id: current_user.id)
  end
end
