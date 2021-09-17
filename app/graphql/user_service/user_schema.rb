module UserService
	class UserSchema < GraphQL::Schema
	  if Gem::Version.new(GraphQL::VERSION) < Gem::Version.new('1.12.0')
	    use GraphQL::Execution::Interpreter
	    use GraphQL::Analysis::AST
	  end
	  include ApolloFederation::Schema

	  query(::UserService::Queries::Root)
	  mutation(::UserService::Mutation::Root)
	end
end
