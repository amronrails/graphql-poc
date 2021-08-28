class User < ApplicationRecord
  has_many :items
  has_many :roles

  validates_presence_of :username, :email
  validates_uniqueness_of :username
  validates_format_of :username, with: /\A[a-zA-Z0-9_-]+\z/, message: 'is invalid'

  attr_accessor :items
end
