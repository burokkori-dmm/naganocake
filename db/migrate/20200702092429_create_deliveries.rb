class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :user_id
      t.string :name
      t.string :postal_cade
      t.string :address

      t.timestamps
    end
  end
end
