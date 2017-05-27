class Car < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :reservations

  geocoded_by :pickup_address
  after_validation :geocode, if: :pickup_address_changed?

  validates :car_type, presence: true
  validates :year, presence: true
  validates :make, presence: true
  validates :model, presence: true
  validates :mileage, presence: true
  validates :qubic_capacity, presence: true
  validates :transmission, presence: true
  validates :fuel_type, presence: true
  validates :color, presence: true
  validates :airbags, presence: true
  validates :doors, presence: true
  validates :seats, presence: true
  validates :description, presence: true, length: { maximum: 1000 }
  validates :daily_price, presence: true, numericality: true
  validates :weekly_price, presence: true, numericality: true
  validates :daily_km, presence: true
  validates :weekly_km, presence: true
  validates :pickup_address, presence: true

  def show_first_photo(size)
    if self.photos.length == 0
      ActionController::Base.helpers.asset_path('black-car.png')
    else
      self.photos[0].image.url(size)
    end
  end
end
