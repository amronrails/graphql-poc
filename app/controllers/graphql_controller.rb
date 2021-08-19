class GraphqlController < ApplicationController
  # If accessing from outside this domain, nullify the session
  # This allows for outside API access while preventing CSRF attacks,
  # but you'll have to authenticate your user separately
  # protect_from_forgery with: :null_session

  def execute(schema)
    graphql_debugging = {
      query: params[:query],
      operationName: params[:operation_name],
      vars: params[:variables],
      schema: schema,
    }
    puts graphql_debugging.inspect

    result = schema.execute(
      params[:query],
      operation_name: params[:operation_name],
      variables: params[:variables],
    )

    render json: result.to_h
  rescue StandardError => e
    raise e unless Rails.env.development?
    handle_error_in_development(e)
  end

  def execute_user
    execute(UserService::UserSchema)
  end

  def execute_item
    execute(ItemService::ItemSchema)
  end

  def execute_role
    execute(RoleService::RoleSchema)
  end

  private

  # Handle variables in form data, JSON body, or a blank value
  def prepare_variables(variables_param)
    case variables_param
    when String
      if variables_param.present?
        JSON.parse(variables_param) || {}
      else
        {}
      end
    when Hash
      variables_param
    when ActionController::Parameters
      variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{variables_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: 500
  end
end
