class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email

#     t.timestamps(default: -> {'CURRENT_TIMESTAMP::timestamp without time zone'})
      t.timestamps
    end
  end
end
