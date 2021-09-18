module RoleService::Types
  class Role < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :user_id, ID, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :previous_version, Integer, null: false
  end
end