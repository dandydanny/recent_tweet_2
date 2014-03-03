class TwitterUser < ActiveRecord::Base
  has_many :tweets
  validates :username, uniqueness: true

  def tweets_are_stale?
    # If no tweets stored, assume stale and force get new tweets
    # Otherwise, check to see if the stored latest tweet is stale
    tweets.empty? || tweets.first.is_stale?
  end

  # Get 10 most recent tweets if not stale.
  # If stale, empty tweets in DB and get new tweets
  def most_recent_tweets
    if tweets_are_stale?
      tweets.destroy_all
      fetch_tweets!
    end

    tweets.limit(10)
  end

  # Do API call and feth new tweets
  def fetch_tweets!
    tweets_from_api = $client.user_timeline(username)
    tweets_from_api.each do |tweet|
      tweets.create(text: tweet.text,
                    twitter_time: tweet.created_at)
    end
  end
end
