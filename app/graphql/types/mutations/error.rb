module Types
  module Mutations
    class Error < ::Types::BaseObject
      field :message, String, null: false
      field :path, [String], null: false
    end
  end
end