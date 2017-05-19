class PhotosController < ApplicationController

  def destroy
    @photo = Photo.find(params[:id])
    car = @photo.car

    @photo.destroy
    @photos = Photo.where(car_id: car.id)

    respond_to :js
  end
end
