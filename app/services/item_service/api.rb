require "graphql/client"
require "graphql/client/http"

module ItemService
  class Api
    extend ::FileHelper

    URL ||= Rails.configuration.services.item_service[:url]
    HTTP ||= GraphQL::Client::HTTP.new(URL)
    Schema ||= GraphQL::Client.load_schema(HTTP)
    Client ||= GraphQL::Client.new(schema: Schema, execute: HTTP)

    CreateItemsMutation ||= Client.parse(read_file(__dir__, 'graphql', 'upsert_items.gql'))

    def self.upsert_items(items_input:)
      result = Client.query(
        CreateItemsMutation, 
        variables: camelize_hash(items_input: items_input)
      )
    end

    private

    def self.camelize_hash(variables)
      variables.deep_transform_keys do |key| 
        key.to_s.camelize(:lower)
      end
    end
  end
end
