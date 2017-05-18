class Car < ApplicationRecord
  belongs_to :user

  validates :type, presence: true
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
  validates :daily_price, presence: true
  validates :weekly_price, presence: true
  validates :daily_km, presence: true
  validates :weekly_km, presence: true
  validates :pickup_address, presence: true
end
