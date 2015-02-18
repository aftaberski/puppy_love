get '/articles/all' do
  if current_user
    @articles = Article.all
    erb :'articles/show_all'
  end
end

get '/articles/new' do
  if current_user
    erb :'articles/new'
  else
    redirect "/"
  end
end

post '/articles/new' do

  params[:article][:user_id]=current_user.id
  article = Article.create(params[:article])

  if article.save
    @article = article
    @user = User.find(article.user_id).name
    redirect "/articles/#{article.id}"
  end
end

# SHOW SINGLE article
get '/articles/:id' do
  @article = Article.find(params[:id])
  erb :'/articles/show_single'
end

# UPDATE article
get '/articles/:id/update' do
  @article = Article.find(params[:id])
  erb :'articles/update'
end

put '/articles/:id' do
  article = Article.find(params[:id])
  params[:article][:user_id] = current_user.id
  article.update(params[:article])
  redirect "/articles/#{article.id}"
end

delete '/articles/:id' do
  article = Article.find(params[:id])
  article.destroy
  redirect '/'
end