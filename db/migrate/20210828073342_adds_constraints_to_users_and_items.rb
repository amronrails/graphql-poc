class AddsConstraintsToUsersAndItems < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :username, unique: true
    add_index :items, [:name, :user_id], unique: true
  end
end
