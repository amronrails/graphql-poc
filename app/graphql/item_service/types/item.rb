module ItemService::Types
	class Item < Types::BaseObject
	  key fields: 'id'

	  field :id, ID, null: false
    field :name, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

	  field :user, 'ItemService::Types::User', null: true

	  def user
	    { __typename: 'ItemService::Types::User', id: object[:user_id] }
	  end
	end
end