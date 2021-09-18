module RoleService::Mutation
  class RollbackRoleInput < ::GraphQL::Schema::InputObject
		argument :id, ID, required: false
		argument :previousVersion, Int, required: false
		argument :event, String, required: false
  end
end