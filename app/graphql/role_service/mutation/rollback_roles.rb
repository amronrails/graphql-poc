module RoleService::Mutation
  class RollbackRoles < ::Types::BaseMutation
    null true

		argument :input, [RollbackRoleInput], required: true

		field :status, Boolean, null: true
		
		def resolve(input:)
				{
					status: Role.revert_to_previous_versions(input)
				}
		end
  end
end
