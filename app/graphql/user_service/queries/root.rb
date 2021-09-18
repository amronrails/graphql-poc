module UserService::Queries
  class Root < ::Types::BaseObject
    field :user, ::UserService::Types::User, null: true do
      argument :id, ID, required: true
    end
    field :users, [::UserService::Types::User], null: true
    
    def user(id:)
      User.find(id)
    end
  	
  	def users
  		User.all
  	end
  end
end
