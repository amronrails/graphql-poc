module UserService::Mutation
  class SaveUser < ::Types::BaseMutation
    null true

    argument :input, UserInput, required: true

    field :status, Boolean, null: false
    field :user, ::UserService::Types::User, null: true
    field :errors, ::UserService::Types::UserError, null: true
    field :trail, [Types::Trail], null: true
    
    def resolve(input:)
      input = input.to_h

      roles = input.delete(:roles) || []
      role_result = nil
      errors = []

      user = User.find_or_initialize_by(id: input[:id])
      
      begin
        user.transaction do
          user.assign_attributes(input)
          user.save

          role_input = { 
            input: { input: deep_merge(roles, userId: user.id) }
          }

          role_result = ::UserService::Remote::ClientRole.query(
           ::UserService::Remote::Mutation::CreateRoles,
           variables: role_input
          )

          user.roles = role_result.data.save_roles.roles
          errors = merge_remote_errors(user, role_result.original_hash["data"]["saveRoles"]["errors"], :roles)

          if errors.any?
            raise ActiveRecord::Rollback, "Call tech support!"
          end
        end

      rescue => error
        errors.push error

        if role_result&.data.present?
          initiate_rollbacks( role_result.original_hash["data"]["saveRoles"]["trail"] )
        end
      end

      
      { 
        status: !errors.any?,
        user: user,
        errors: errors,
        trail: []
      }
    end

    def merge_remote_errors(user, errors, key)
      return user.errors.to_h unless errors.any?
      user.errors.to_h.merge({key => errors})
    end
    
    def deep_merge(array, hash={})
      array.map do |obj|
        obj.merge(hash)
      end
    end

    def initiate_rollbacks(trail)
      rollback_input = { 
        input: {input: trail}
      }
      
      rollback =  ::UserService::Remote::ClientRole.query(
       ::UserService::Remote::Mutation::RollbackRoles,
       variables: rollback_input
      )
    end
  end
end
