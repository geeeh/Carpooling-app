# frozen_string_literal: true

class Ride < ApplicationRecord
  belongs_to :vehicle
  has_many :requests, dependent: :destroy
  validates :time, :remaining_capacity, :origin, :destination, presence: true

  scope(:available_rides, lambda do
    where('time > ?', Time.now).where('remaining_capacity >?', 0)
  end)

  scope(:search, lambda do |name|
    @rides = where('lower(origin) like lower(?) OR lower(destination) like lower(?)',
                   name[:origin], name[:destination])
  end)
end
