post "/articles/:id/votes" do |id|
  article = Article.find(id)
  if article.votes.find_by(user_id: current_user.id)
    return (article.votes.count).to_json
  else
    article.votes.create(user_id: current_user.id)

    if request.xhr?
      content_type :json
      (article.votes.count).to_json
    else
      redirect "/"
    end
  end
end