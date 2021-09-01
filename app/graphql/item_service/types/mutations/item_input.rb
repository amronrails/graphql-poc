module ItemService
  module Types
    module Mutations
      class ItemInput < ::Types::BaseInputObject
        argument :id, ID, required: false
        argument :user_id, Int, required: true
        argument :name, String, required: true
      end
    end
  end
end
