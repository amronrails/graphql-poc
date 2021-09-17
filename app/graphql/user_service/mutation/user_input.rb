module UserService::Mutation
  class UserInput < ::GraphQL::Schema::InputObject
	argument :username, String, required: true
	argument :email, String, required: true
	argument :roles, [RoleInput], required: false
	argument :id, ID, required: false
  end
end