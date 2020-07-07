class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :payment_method, null:false
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :postage, default: 800, null:false
      t.integer :order_status, defalut: 0
      t.integer :order_price

      t.timestamps
    end
  end
end
