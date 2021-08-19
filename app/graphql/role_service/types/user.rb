module RoleService::Types
  class User < Types::BaseObject
    key fields: 'id'
    extend_type

    field :id, ID, null: false, external: true
    field :roles, [Role], null: true

    def roles
      ::Role.where(user_id: object[:id])
    end
  end
end