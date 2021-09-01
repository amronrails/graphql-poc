module ItemService
	class ItemSchema < GraphQL::Schema
		include ApolloFederation::Schema

		query(::ItemService::Queries::Root)
		mutation(::ItemService::Mutations::Root)
	end
end
