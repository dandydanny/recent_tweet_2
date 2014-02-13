get '/' do
  erb :index
end

# Direct-access by /<twitter_name>
get '/:username' do
  puts "---------- normal post --------------="
  @username = params[:username]
  user = TwitterUser.find_or_create_by_username(params[:username])
  @tweets = user.most_recent_tweets
  erb :index
end

post '/get_user_tweets' do
  redirect("/#{params[:username]}")
end

post '/ajax_post' do
  puts "-=========  ajax_post. ================= "
  @username = params[:twitter_user] # for view's username display
  user = TwitterUser.find_or_create_by_username(params[:twitter_user])
  @tweets = user.most_recent_tweets
  puts "~~~~~~~~~~ checking for staleness ~~~~~~~~~~"
  print ">>>>>>>>>>>>> in /ajax_post, user.tweets_are_stale is " + user.tweets_are_stale?.to_s + ">>>>>"
  erb :_tweet_table, :layout => false
  # return :_tweet_table
end

get '/error' do
  erb :error
end

def get_user_timeline_tweets(params)
  $client.user_timeline(params)
end

def local_user?(params)
  TwitterUser.find_by_username(params)
end
