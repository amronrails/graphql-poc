module UserService
  module Types
    module Mutations
      class UserInput < ::Types::BaseInputObject
        argument :id, ID, required: false
        argument :username, String, required: true
        argument :email, String, required: false
        argument :items, [UserItemInput], required: false
      end
    end
  end
end
