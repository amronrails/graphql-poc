module UserService::Mutation
  class Root < ::Types::BaseObject
    field :save_user, mutation: ::UserService::Mutation::SaveUser
  end
end
