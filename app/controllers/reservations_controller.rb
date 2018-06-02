class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_room, only: %i(new create)

  def new
  end

  def create
    reservated_days = @room.reservations
    reservation = Reservation.new(reservation_params)
    duplicate = false
    reservated_days.each do |reservated_day|
      if reservated_day.check_in_date <= reservation.check_out_date && reservated_day.check_out_date >= reservation.check_in_date
        duplicate = true
        break
      end
    end
    if duplicate == true
      render :new
    else
      if reservation.save
        redirect_to root_path
      else
        render :new
      end
    end
  end

  private
  def set_room
    @room = Room.find(params[:room_id])
  end

  def reservation_params
    params.require(:reservation).permit(:check_in_date,
                                        :check_out_date,
                                        :guests)
                                .merge(user_id: current_user.id, room_id: params[:room_id])
  end
end
