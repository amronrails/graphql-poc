module RoleService::Types
  class RoleError < Types::BaseObject
    field :id, String, null: true
    field :title, String, null: true
    field :user_id, String, null: true
    field :user, String, null: true
    field :created_at, String, null: true
    field :updated_at, String, null: true
  end
end