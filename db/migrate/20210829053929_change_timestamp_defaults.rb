class ChangeTimestampDefaults < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :created_at,
      from: -> {'NULL::timestamp without time zone'},
        to: -> {'CURRENT_TIMESTAMP::timestamp without time zone'}
    change_column_default :users, :updated_at,
      from: -> {'NULL::timestamp without time zone'},
        to: -> {'CURRENT_TIMESTAMP::timestamp without time zone'}
    change_column_default :items, :created_at,
      from: -> {'NULL::timestamp without time zone'},
        to: -> {'CURRENT_TIMESTAMP::timestamp without time zone'}
    change_column_default :items, :updated_at,
      from: -> {'NULL::timestamp without time zone'},
        to: -> {'CURRENT_TIMESTAMP::timestamp without time zone'}
    change_column_default :roles, :created_at,
      from: -> {'NULL::timestamp without time zone'},
        to: -> {'CURRENT_TIMESTAMP::timestamp without time zone'}
    change_column_default :roles, :updated_at,
      from: -> {'NULL::timestamp without time zone'},
        to: -> {'CURRENT_TIMESTAMP::timestamp without time zone'}
  end
end
