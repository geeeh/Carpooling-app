# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :ride, class_name: 'Request', foreign_key: 'ride_id'
  belongs_to :user
  validates :pickup, :dropoff, presence: true
end
