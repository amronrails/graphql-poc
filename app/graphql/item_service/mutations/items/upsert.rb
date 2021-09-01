module ItemService
  module Mutations
    module Items
      class Upsert < ::Types::BaseMutation
        argument :items_input, [Types::Mutations::ItemInput], required: true
  
        field :items, [Types::Item], null: true
        field :errors, [Types::Mutations::ItemError], null: true
  
        def resolve(items_input:)
          item_ids = items_input.map(&:id)
          found_items = Item.where(id: item_ids).index_by(&:id)
          items = items_input.map do |item_input|
            if item_input.id
              item = found_items[item_input.id.to_i]
              item.assign_attributes(
                name: item_input.name,
                user_id: item_input.user_id
              )
              item
            else
              Item.new(
                name: item_input.name,
                user_id: item_input.user_id
              )
            end
          end

          save_transaction(items: items)
        end

        private

        def save_transaction(items:)
          errors = []

          Item.transaction do
            items.each do |item|
              item.save
              item.errors.each_with_index do |error, index|
                errors << {
                  path: [index, error.attribute.to_s.camelize(:lower)], 
                  message: error.full_message
                }
              end
            end

            if errors.any?
              items = []
              raise ActiveRecord::Rollback
            end
          end
          {
            items: items,
            errors: errors
          }
        end
      end
    end
  end
end