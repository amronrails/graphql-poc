class Role < ApplicationRecord
  belongs_to :user

  validates_presence_of :user_id, :title
end
