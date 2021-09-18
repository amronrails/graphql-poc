module RoleService::Mutation
  class SaveRole < ::Types::BaseMutation
    null true

		argument :input, RoleInput, required: true

		field :role, ::RoleService::Types::Role, null: true
		
		def resolve(input:)
		end
  end
end
