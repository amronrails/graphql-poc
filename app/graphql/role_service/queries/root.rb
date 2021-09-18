module RoleService::Queries
  class Root < ::Types::BaseObject
    field :roles, [::RoleService::Types::Role], null: true do
      argument :user_id, ID, required: false
    end
    
    def roles(user_id:)
      Role.where(user_id: user_id)
    end
  end
end
