module UserService
  module Types
    module Mutations
      class UserItem < ::Types::BaseObject
        field :id, ID, null: false
        field :name, String, null: false
      end
    end
  end
end
