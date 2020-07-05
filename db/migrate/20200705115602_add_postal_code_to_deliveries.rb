class AddPostalCodeToDeliveries < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveries, :postal_code, :string
  end
end
