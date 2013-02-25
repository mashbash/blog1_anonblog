get '/tag/:tag' do
puts "[LOG TAG] #{params}"
puts "[LOG TAG] #{params[:tag]}"
@tag = Tag.find_by_description(params[:tag])
@posts_of_tag = @tag.posts
puts "[LOG POSTS OF TAG] #{@posts_of_tag}"
erb :tag
end
