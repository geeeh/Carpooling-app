# frozen_string_literal: true

class Ride < ApplicationRecord
  belongs_to :vehicle, class_name: 'Vehicle', foreign_key: 'vehicle_id'
  has_many :requests, dependent: :destroy
  validates :time, :remaining_capacity, :from, :to, presence: true
end
