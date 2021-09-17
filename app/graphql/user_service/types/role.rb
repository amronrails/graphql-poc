module UserService::Types
	class Role < Types::BaseObject
		field :id, ID, null: false
		field :title, String, null: true
		field :user_id, ID, null: true
		field :errors, ::UserService::Types::RoleError, null: true
	end
end