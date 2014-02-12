class TwitterUser < ActiveRecord::Base
  has_many :tweets
  validates :username, uniqueness: true

  def tweets_are_stale?
    tweets.empty? || tweets.first.is_stale?
  end

  def most_recent_tweets
    if tweets_are_stale?
      tweets.destroy_all
      fetch_tweets!
    end

    tweets.limit(10)
  end

  def fetch_tweets!
    tweets_from_api = $client.user_timeline(username)
    tweets_from_api.each do |tweet|
      tweets.create(text: tweet.text,
                         twitter_time: tweet.created_at)
    end
  end
end
