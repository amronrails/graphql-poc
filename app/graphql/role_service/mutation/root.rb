module RoleService::Mutation
  class Root < ::Types::BaseObject
    field :save_role, mutation: ::RoleService::Mutation::SaveRole
    field :save_roles, mutation: ::RoleService::Mutation::SaveRoles
  end
end
