module UserService::Remote::Mutation
  CreateRoles = ::UserService::Remote::ClientRole.parse <<-'GRAPHQL'
    mutation($input: SaveRolesInput!) {
      saveRoles(input: $input ){
        status
        roles {
          id
          title
          userId
          previousVersion
        }
        errors {
          id
          title
          userId
          user
        }
        trail {
          id
          previousVersion
          event
        }
      }
    }
  GRAPHQL

  RollbackRoles = ::UserService::Remote::ClientRole.parse <<-'GRAPHQL'
    mutation($input: RollbackRolesInput!) {
      rollbackRoles(input: $input ){
        status
      }
    }
  GRAPHQL

  Roles = ::UserService::Remote::ClientRole.parse <<-'GRAPHQL'
    query($rolesUserId: ID) {
      roles(userId: $rolesUserId){
        id
        title
        userId
        previousVersion
      }
    }
  GRAPHQL
end
