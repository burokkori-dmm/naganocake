class RemovePostalCadeFromDeliveries < ActiveRecord::Migration[5.2]
  def change
    remove_column :deliveries, :postal_cade, :string
  end
end
