class AddSubLastNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sub_last_name, :string
  end
end
