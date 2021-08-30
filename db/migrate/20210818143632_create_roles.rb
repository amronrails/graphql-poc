class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title

#     t.timestamps(default: -> {'CURRENT_TIMESTAMP::timestamp without time zone'})
      t.timestamps
    end
  end
end
