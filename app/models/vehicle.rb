# frozen_string_literal: true

# Vehicle model.
# Responsible for all the vehicle model validations and model functions
class Vehicle < ApplicationRecord
  validates :plate, :capacity, :make, :colour, presence: true
  validates :plate, length: {
    minimum: 6,
    maximum: 8
  }, uniqueness: true

  has_many :rides, class_name: 'ride', foreign_key: 'vehicle_id'
end
