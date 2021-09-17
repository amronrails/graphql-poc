module RoleService::Mutation
  class RoleInput < ::GraphQL::Schema::InputObject
	argument :title, String, required: true
	argument :user_id, ID, required: false
	argument :id, ID, required: false
  end
end