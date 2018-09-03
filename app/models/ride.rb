# frozen_string_literal: true

class Ride < ApplicationRecord
  belongs_to :vehicle
  has_many :requests, dependent: :destroy
  validates :time, :remaining_capacity, :origin, :destination, presence: true
end
