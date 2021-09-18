module Types
	class Trail < BaseObject
		field :id, ID, null: false
		field :previous_version, Integer, null: false
		field :event, String, null: false
	end
end