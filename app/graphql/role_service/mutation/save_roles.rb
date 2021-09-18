module RoleService::Mutation
  class SaveRoles < ::Types::BaseMutation
    null true

    argument :input, [RoleInput], required: true

    field :status, Boolean, null: false
    field :roles, [::RoleService::Types::Role], null: true
    field :errors, [::RoleService::Types::RoleError], null: true
    field :trail, [Types::Trail], null: true

    def resolve(input:)
      output = bulk_save(::Role, input)
      roles = Role.where(user_id: input.first&.user_id)
      
      {
        status: output[0],
        roles:  roles,
        errors: output[1],
        trail:  output[2]
      }
    end

    def bulk_save(model, input)
      status = true 
      errors = []
      trail = []

      model.transaction do
        input.each do |object|
          record = model.find_or_initialize_by(id: object[:id])
          record.assign_attributes(object.to_h)
          unless record.save
            errors.push record.errors.to_h
          end
          trail.push get_trail(record)
        end

        if errors.any?
          status = false
          raise ActiveRecord::Rollback, "Call tech support!"  
        end
      end

      return status, errors, trail
    end

    def get_trail(object)
      event = object.id_previously_changed? ? 'create' : 'update'
      {
        id: object.id,
        event: event,
        previous_version: (object&.previous_version || 0)
      }
    end

  end
end
