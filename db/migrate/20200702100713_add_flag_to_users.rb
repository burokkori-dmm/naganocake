class AddFlagToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :flag, :boolean
  end
end
