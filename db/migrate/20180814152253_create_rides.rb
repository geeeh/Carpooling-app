# frozen_string_literal: true

class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.datetime :time
      t.integer :remaining_capacity
      t.string :origin
      t.string :destination
      t.belongs_to :vehicle, index: true
      t.timestamps
    end
  end
end
