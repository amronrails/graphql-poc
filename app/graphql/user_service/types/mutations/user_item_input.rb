module UserService
  module Types
    module Mutations
      class UserItemInput < ::Types::BaseInputObject
        argument :id, ID, required: false
        argument :name, String, required: true
      end
    end
  end
end
