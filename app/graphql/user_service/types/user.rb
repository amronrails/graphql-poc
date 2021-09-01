module UserService::Types
	class User < Types::BaseObject
		key fields: 'id'

		field :id, ID, null: false
		field :username, String, null: true
		field :email, String, null: true
		field :created_at, GraphQL::Types::ISO8601DateTime, null: false
		field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

		def self.resolve_reference(object, _context)
			::User.find(object[:id])
		end
	end
end
