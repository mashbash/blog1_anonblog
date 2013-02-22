class Post < ActiveRecord::Base
  # Remember to create a migration!
  has_many :post_tags
  has_many :tags, :through => :task_tags

end
