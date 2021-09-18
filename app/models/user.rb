class User < ApplicationRecord
  has_paper_trail
  attr_accessor :roles
  validates_presence_of :username

  def roles
    @roles || get_roles.data.roles
  end

  def get_roles
    ::UserService::Remote::ClientRole.query(
       ::UserService::Remote::Mutation::Roles,
       variables: { rolesUserId: id }
      )
  end
end
