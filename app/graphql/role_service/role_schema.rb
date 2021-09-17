module RoleService
	class RoleSchema < GraphQL::Schema
		include ApolloFederation::Schema

		mutation(::RoleService::Mutation::Root)

		orphan_types ::RoleService::Types::User, ::RoleService::Types::Role
	end
end
