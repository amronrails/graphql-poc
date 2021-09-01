module UserService
  module Mutations
    class Root < ::Types::BaseObject
      field :create_user, mutation: ::UserService::Mutations::Users::Create
      field :update_user, mutation: ::UserService::Mutations::Users::Update
    end
  end
end
