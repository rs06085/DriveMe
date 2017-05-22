class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def preload
    car = Car.find(params[:car_id])
    today = Date.today
    reservations = car.reservations.where("start_date >= ? OR end_date >= ?", today, today)

    render json: reservations
  end

  def preview
    start_date = Date.parse(params[:start_date])
    end_date = Date.parse(params[:end_date])

    output = {
      conflict: is_conflict(start_date, end_date)
    }

    render json: output
  end

  def create
    @reservation = current_user.reservations.create(reservation_params)

    redirect_to @reservation.car, notice: "Your request has been sent"
  end

  def your_trips
    @trips = current_user.reservations
  end

  def your_reservations
    @cars = current_user.cars
  end

  private
  def is_conflict(start_date, end_date)
    car = Car.find(params[:car_id])

    check = car.reservations.where("? < start_date AND end_date < ?", start_date, end_date)
    check.size > 0? true : false
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :price, :total, :car_id)
  end
end
