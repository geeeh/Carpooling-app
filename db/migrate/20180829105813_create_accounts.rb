class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :first_name
      t.string :last_name
      t.integer :identification
      t.string :phone_number
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
