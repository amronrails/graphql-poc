module UserService::Types
	class UserError < Types::BaseObject
		field :id, String, null: true
		field :username, String, null: true
		field :email, String, null: true
    	field :roles, [::UserService::Types::RoleError], null: true
	end
end
