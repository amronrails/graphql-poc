module RoleService::Mutation
  class SaveRoles < ::Types::BaseMutation
    null true

    argument :input, [RoleInput], required: true

    field :status, Boolean, null: false
    field :roles, [::RoleService::Types::Role], null: true
    field :errors, [::RoleService::Types::RoleError], null: true

    def resolve(input:)
      output = bulk_save(::Role, input)
      roles = Role.where(user_id: input.first&.user_id)
      {
        status: output[0],
        roles:  roles,
        errors: output[1]
      }
    end

    def bulk_save(model, input)
      status = true 
      errors = []
      parent_id = nil

      model.transaction do
        input.each do |object|
          record = model.find_or_initialize_by(id: object[:id])
          record.assign_attributes(object.to_h)
          unless record.save
            errors.push record.errors.to_h
          end
        end

        if errors.any?
          status = false
          raise ActiveRecord::Rollback, "Call tech support!"  
        end
      end

      return status, errors
    end

  end
end
