# frozen_string_literal: true

class Request < ApplicationRecord
  belongs_to :ride, class_name: 'Ride', foreign_key: 'ride_id'
  validates :pickup, :status, presence: true
end
