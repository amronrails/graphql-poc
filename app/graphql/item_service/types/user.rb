module ItemService::Types
  class User < Types::BaseObject
    key fields: 'id'
    extend_type

    field :id, ID, null: false, external: true
    field :items, [Item], null: true

    def items
      ::Item.where(user_id: object[:id])
    end
  end
end