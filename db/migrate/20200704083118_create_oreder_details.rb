class CreateOrederDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :oreder_details do |t|
      t.integer :sweet_id
      t.integer :order_id
      t.integer :peace
      t.integer :tax_price
      t.integer :making_status, default:1

      t.timestamps
    end
  end
end
