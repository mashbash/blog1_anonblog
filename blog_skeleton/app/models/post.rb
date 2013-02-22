class Post < ActiveRecord::Base
  # Remember to create a migration!
  has_and_belongs_to_many :tags, :join_table => :posts_tags

end
