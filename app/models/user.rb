class User < ApplicationRecord
  has_many :items
  has_many :roles

  validates_presence_of :username
end
