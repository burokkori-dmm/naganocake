class CreateSweets < ActiveRecord::Migration[5.2]
  def change
    create_table :sweets do |t|
      t.integer :genre_id
      t.string :name
      t.integer :tax_free_price
      t.text :detail
      t.string :image_id
      t.integer :sale_status

      t.timestamps
    end
  end
end
