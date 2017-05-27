class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @cars = @user.cars
  end
end
