# frozen_string_literal: true

class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.datetime :time
      t.integer :remaining_capacity
      t.string :from
      t.string :to
      t.belongs_to :vehicles, index: true
      t.timestamps
    end
  end
end
