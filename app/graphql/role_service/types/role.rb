module RoleService::Types
	class Role < Types::BaseObject
	  key fields: 'id'

	  field :id, ID, null: false
    field :title, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

	  field :user, 'RoleService::Types::User', null: true

	  def user
	    { __typename: 'RoleService::Types::User', id: object[:user_id] }
	  end
	end
end