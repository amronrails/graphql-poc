module RoleService::Mutation
  class SaveRole < ::Types::BaseMutation
    null true

	argument :input, RoleInput, required: true
	argument :user_id, ID, required: true

	field :role, ::RoleService::Types::Role, null: true
	
	def resolve(input:)
      p '---'*100
		
		Role.new(input.to_h)
		{ role: Role.find(input) }
	end
  end
end
