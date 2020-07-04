class CreateOrederDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :oreder_details do |t|
      t.integer :sweet_id
      t.integer :order_id
      t.integer :peace
      t.integer :tax_price
      t.string :making_status

      t.timestamps
    end
  end
end
