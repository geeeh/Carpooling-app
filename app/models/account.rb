# frozen_string_literal: true

class Account < ApplicationRecord
  has_one :user
  validates :first_name, :last_name, :phone_number, :identification, presence: true
end
