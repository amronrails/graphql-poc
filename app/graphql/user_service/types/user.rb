module UserService::Types
	class User < Types::BaseObject
		field :id, ID, null: false
		field :username, String, null: true
		field :email, String, null: true
    	field :roles, [Role], null: true
		field :created_at, GraphQL::Types::ISO8601DateTime, null: false
		field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    	field :errors, ::UserService::Types::UserError, null: true

    	def errors
    		object.errors.to_h
    	end
	end
end
