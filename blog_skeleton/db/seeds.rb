require 'faker'
require_relative '../app/models/post'

20.times do
  Post.create(title: Faker::Lorem.sentence,
              content: Faker::Lorem.paragraph)
end

