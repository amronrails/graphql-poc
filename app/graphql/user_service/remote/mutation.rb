module UserService::Remote::Mutation
  CreateRoles = ::UserService::Remote::ClientRole.parse <<-'GRAPHQL'
    mutation($input: SaveRolesInput!) {
      saveRoles(input: $input ){
        status
        roles {
          id
          title
          userId
        }
        errors {
          id
          title
          userId
          user
        }
      }
    }
  GRAPHQL
end
