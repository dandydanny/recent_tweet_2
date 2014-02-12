get '/' do
  erb :index
end

get '/:username' do
  @username = params[:username]

  user = TwitterUser.find_or_create_by_username(params[:username])
  @tweets = user.most_recent_tweets


  erb :index
end

post '/get_user_tweets' do
  redirect("/#{params[:username]}")
end

post '/ajax_post' do
  puts "-========= received the param at ajax_post ================= "
  p params[:twitter_user]
  erb :_tweet_table
end

get '/error' do
  erb :error
end

 # $client.user_timeline.each do |tweet| p "#{tweet.text}" end

# .new
# .build
# .create

def get_user_timeline_tweets(params)
  $client.user_timeline(params)
end

def local_user?(params)
  TwitterUser.find_by_username(params)
end
