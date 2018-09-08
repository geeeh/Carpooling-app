# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :ride, class_name: 'Ride', foreign_key: 'ride_id'
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  validates :pickup, :dropoff, presence: true
end
