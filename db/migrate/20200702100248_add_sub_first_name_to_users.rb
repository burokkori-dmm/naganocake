class AddSubFirstNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sub_first_name, :string
  end
end
