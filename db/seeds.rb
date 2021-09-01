# SQL logging for seed.rb
ActiveRecord::Base.logger = Logger.new(STDOUT)
# Use `rails db:truncate_all` to get rid of data before populating
ApplicationRecord.transaction do
  10.times do |i|
    user = User.create!(username: "user_#{i}", email: "user#{i}@mail.com")
    user.roles.create!(title: 'User')
    10.times do |j|
      user.items.create!(name: "Item ##{j}")
    end
  end
end
