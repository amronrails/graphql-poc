class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name

#     t.timestamps(default: -> {'CURRENT_TIMESTAMP::timestamp without time zone'})
      t.timestamps
    end
  end
end