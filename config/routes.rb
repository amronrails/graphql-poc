Rails.application.routes.draw do
  root to: "application#status"
  get "/status", to: "application#status"
  post "/graphql/user_service", to: "graphql#execute_user"
  post "/graphql/item_service", to: "graphql#execute_item"
  post "/graphql/role_service", to: "graphql#execute_role"
end
