class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token

	def status
		render status: :ok, json: { status: "OK" }
	end
end
