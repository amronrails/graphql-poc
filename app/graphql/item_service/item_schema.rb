module ItemService
	class ItemSchema < GraphQL::Schema
		include ApolloFederation::Schema

		orphan_types ItemService::Types::User, ItemService::Types::Item
	end
end
