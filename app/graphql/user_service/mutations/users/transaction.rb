module UserService
  module Mutations
    module Users
      module Transaction
        def self.included(base)
          base.class_eval do
            argument :user_input, Types::Mutations::UserInput, required: true

            field :user, Types::User, null: true
            field :items, [Types::Mutations::UserItem], null: true
            field :errors, [Types::Mutations::UserError], null: true
          end
        end

        private

        def save_transaction(user:, items_input:)
          errors = []
          items = []

          User.transaction do
            if user.save
              if items_input
                items_params = items_input.map do |item_input|
                  { id: item_input.id, name: item_input.name, user_id: user.id }
                end

                result = ItemService::Api.upsert_items(items_input: items_params)
              end
            end

            items_err = result&.data&.upsert_items&.errors || []
            items = result&.data&.upsert_items&.items || []

            errors = user.errors.map do |error|
              path = [error.attribute.to_s.camelize(:lower)]
              { path: path, message: error.full_message }
            end

            items_err.map do |error|
              path = ["items", *error.path]
              errors << { path: path, message: error.message }
            end

            if errors.any?
              user = nil
              raise ActiveRecord::Rollback
            end
          end
          {
            user: user,
            items: items,
            errors: errors
          }
        end
      end
    end
  end
end
