module UserService::Mutation
  class RoleInput < ::GraphQL::Schema::InputObject
	argument :title, String, required: true
	argument :id, ID, required: false
  end
end