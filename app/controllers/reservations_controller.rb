class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def create
    @reservation = current_user.reservations.create(reservation_params)

    redirect_to @reservation.car, notice: "Your request has been sent"
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :price, :total, :car_id)
  end
end
