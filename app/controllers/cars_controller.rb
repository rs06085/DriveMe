class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]

  def index
    @cars = current_user.cars
  end

  def show
    @photos = @car.photos
  end

  def new
    @car = current_user.cars.build
  end

  def create
    @car = current_user.cars.build(car_params)

    if @car.save
      if params[:images]
        params[:images].each do |image|
          @car.photos.create(image: image)
        end
      end

      @photos = @car.photos
      redirect_to edit_car_path(@car), notice: "Car added successfully"
    else
      render :new
    end
  end

  def edit
    if current_user.id == @room.user.id
      @photos = @car.photos
    else
      redirect_to root_path, notice: "You don't have permission"
    end
  end

  def update
    if @car.update(car_params)

      if params[:images]
        params[:images].each do |image|
          @car.photos.create(image: image)
        end
      end

      redirect_to edit_room_path(@car), notice: "Car listing was updated successfully"
    else
      render :edit
    end
  end

  private
    def set_car
      @car = Car.find(params[:id])
    end

    def car_params
      params.require(:car).permit(:car_type, :year, :make, :model, :mileage, :qubic_capacity, :transmission, :fuel_type,
                                  :color, :airbags, :seats, :doors, :description, :is_all_wheel, :is_air, :is_babyseat,
                                  :is_cd_player, :is_gps, :is_pet_friendly, :is_radio, :is_camera, :is_wedding_car,
                                  :daily_price, :weekly_price, :daily_km, :weekly_km, :pickup_address, :dropoff_address,
                                  :delivery, :delivery_price, :insurance_expiry_date, :active)
    end

end
