module ItemService::Queries
  class Root < ::Types::BaseObject
    field :items, [::ItemService::Types::Item], null: true do
      argument :user_id, Int, required: false
      argument :ids, [Int], required: false
    end
    
    def items(user_id: nil, ids: [])
      scope = Item
      scope = scope.where(user_id: user_id) if user_id
      scope = scope.where(id: ids) if ids
      scope.all
    end
  end
end
