module RoleService
	class RoleSchema < GraphQL::Schema
		include ApolloFederation::Schema

		mutation(::RoleService::Mutation::Root)
		query(::RoleService::Queries::Root)
	end
end
