# frozen_string_literal: true

class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :plate
      t.integer :capacity
      t.string :colour
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
