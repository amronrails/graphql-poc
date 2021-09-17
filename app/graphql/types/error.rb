module Types
	class Error < BaseObject
		field :attribute, String, null: false
		field :type, String, null: false
		field :options, ::GraphQL::Types::JSON, null: true 
	end
end