module Types
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
	object_class ::Types::BaseObject
  end
end