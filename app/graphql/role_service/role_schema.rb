module ItemService
	class ItemSchema < GraphQL::Schema
		include ApolloFederation::Schema

		orphan_types RoleService::Types::User, RoleService::Types::Role
	end
end
