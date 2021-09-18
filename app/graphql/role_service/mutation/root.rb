module RoleService::Mutation
  class Root < ::Types::BaseObject
    field :save_role, mutation: ::RoleService::Mutation::SaveRole
    field :save_roles, mutation: ::RoleService::Mutation::SaveRoles
    field :rollback_roles, mutation: ::RoleService::Mutation::RollbackRoles
  end
end
