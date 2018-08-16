# frozen_string_literal: true

class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :pickup
      t.boolean :status
      t.belongs_to :user, index: true
      t.belongs_to :rides, index: true
      t.timestamps
    end
  end
end
