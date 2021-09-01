module UserService
  module Mutations
    module Users
      class Create < ::Types::BaseMutation
        include Transaction

        def resolve(user_input:)
          user = User.new(
            username: user_input.username,
            email: user_input.email
          )

          save_transaction(user: user, items_input: user_input.items)
        end
      end
    end
  end
end