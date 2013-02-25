
get '/post/new' do
  # @post = Post.new
  erb :newpost
end

post '/post' do
  # puts "[LOG POST] #{params}" 
  #BUGBUG not reading in the post id from the edit post page pull that in and make it appear here!
  # puts "[LOG NEW POST ] #{params}" 
  # puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"

  if params[:post_id].nil?
    @newpost = Post.new(title: params[:title],
                      content: params[:content])
    @newpost.save
    tags = params[:tags].split(/[\s,]+/)
    tags.each do |tag|
      @newpost.tags << Tag.create(description: tag)
    end
    # going to have to put a validation for unique tag and if error how to handle it
    redirect "/post/#{@newpost.id}"
  else
  # puts "[LOG EDIT POST] #{params}" 
  # puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
    @post = Post.find_by_id(params[:post_id])
    @post.update_attributes(title: params[:title],
                            content: params[:content])
    @post.tags = []
    tags = params[:tags].split(/[\s,]+/)
    tags.each do |tag|
      @post.tags << Tag.find_or_create_by_description(tag)
    end
    redirect "/post/#{@post.id}"
  end  
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
  puts "[LOG DELETE] #{params}"
  @post = Post.find_by_id(params[:post_id])
  @post.destroy
  redirect '/'
end






