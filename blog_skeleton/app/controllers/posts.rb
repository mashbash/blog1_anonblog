
get '/post/new' do
  # @post = Post.new
  erb :newpost
end

post '/post' do
  @newpost = Post.new(title: params[:title],
                      content: params[:content])
  @newpost.save
  # puts "[LOG TAGS] #{params[:tags]}"
  tags = params[:tags].split(/[\s,]+/)
  # puts "[LOG TAGS SPLIT] #{tags}"
  tags.each do |tag|
    @newpost.tags << Tag.create(description: tag)
  end  
  # puts "[LOG] #{@newpost.title}"
  # puts "[LOG] #{@newtag.description}"
  redirect "/post/#{@newpost.id}"

end

get '/post/:post_id' do
  puts "[LOG] #{params[:post_id]}"
  @post = Post.find_by_id(params[:post_id])
  erb :post
end  

post '/post/edit' do
  # update the attributes that were rewritten
  # redirect back to it's own page
end

  



