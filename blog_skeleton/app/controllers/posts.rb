
get '/post/new' do
  # @post = Post.new
  erb :newpost
end

post '/post' do
  puts "[LOG POST] #{params}" 
  #BUGBUG not reading in the post id from the edit post page pull that in and make it appear here!
  if params[:post_id] == " "
    @newpost = Post.new(title: params[:title],
                      content: params[:content])
    @newpost.save
  # puts "[LOG TAGS] #{params[:tags]}"
    tags = params[:tags].split(/[\s,]+/)
  # puts "[LOG TAGS SPLIT] #{tags}"
    tags.each do |tag|
      @newpost.tags << Tag.create(description: tag)
    end
    # going to have to put a validation for unique tag and if error how to handle it
    redirect "/post/#{@newpost.id}"
  else
    @post = Post.find_by_id(params[:post_id])
    @post.update_attributes(title: params[:title],
                            content: params[:content])
    tags.each do |tag|
      @post.tags << Tag.create(description: tag)
    end
    redirect "/post/#{@post.id}"
  end  
  # puts "[LOG] #{@newpost.title}"
  # puts "[LOG] #{@newtag.description}"
end

get '/post/:post_id' do
  puts "[LOG WHAT] #{params[:post_id]}"
  @post = Post.find_by_id(params[:post_id])
  erb :post
end  

get '/post/edit/:post_id' do
  @post = Post.find_by_id(params[:post_id])
  erb :edit
end

post '/post/delete' do


end






