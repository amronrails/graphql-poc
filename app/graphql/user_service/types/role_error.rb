module UserService::Types
	class RoleError < Types::BaseObject
		field :id, String, null: true
		field :title, String, null: true
		field :user, String, null: true
		field :user_id, String, null: true, hash_key: :userId
	end
end