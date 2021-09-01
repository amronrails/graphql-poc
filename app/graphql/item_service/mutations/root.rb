module ItemService
  module Mutations
    class Root < ::Types::BaseObject
      field :upsert_items, mutation: ::ItemService::Mutations::Items::Upsert
    end
  end
end
