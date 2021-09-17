module UserService::Queries
  class Root < ::Types::BaseObject
    field :me, ::UserService::Types::User, null: true
    field :users, [::UserService::Types::User], null: true
    
    def me
      User.first
    end
  	
  	def users
  		User.all
  	end
  end
end
