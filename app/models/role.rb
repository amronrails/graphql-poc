class Role < ApplicationRecord
  has_paper_trail
  validates_presence_of :user_id, :title

  EVENT_UPDATE = 'update'
  EVENT_CREATE = 'create'
  EVENT_DELETE = 'delete'

  def self.revert_to_previous_versions(roles)
      success = true
      transaction do 
        roles.each do |role|
          case role.event

          when EVENT_UPDATE
            success = find(role.id).versions[role.previousVersion].reify.save
          
          when EVENT_CREATE
            success = find(role.id).destroy!
              
          when EVENT_DELETE
            role = self.new(id: role.id)
            success = role.versions[role.previousVersion].reify.save
          end

          unless success
            success = false
            raise ActiveRecord::Rollback, "Call tech support!"
          end
        end
      end
  
    success
  end

  def previous_version
    versions.count-1
  end
end
