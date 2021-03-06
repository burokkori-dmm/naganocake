class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :payment_method, null:false
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :postage, null:false, default: 800
      t.integer :order_status, null:false, defalut: 0

      t.timestamps
    end
  end
end
