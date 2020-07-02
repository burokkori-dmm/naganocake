class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :user_id
      t.integer :sweet_id
      t.integer :peace

      t.timestamps
    end
  end
end
