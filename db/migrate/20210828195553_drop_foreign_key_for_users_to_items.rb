class DropForeignKeyForUsersToItems < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :items, :users
  end
end
