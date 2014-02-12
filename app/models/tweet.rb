class Tweet < ActiveRecord::Base
  belongs_to :twitter_user

  def average_tweet_time
    # find average time between tweets based on last two tweets
    # last_tweet_time - TwitterUser.first.tweets[2].twitter_time

    # (Twitter.counUser.first.tweets.reduce(:+)) / TwitterUser.first.tweets.length
    # Use AR .sum feature? (Can't seem to do with with plain AR query)

    # To do:
    # Don't attempt compare the time difference between two tweets if
    # user only has one tweet.

    puts "==================================="
    puts self.id
    puts self.id + 1
    latest = Tweet.find(self.id).twitter_time
    previous = Tweet.find(self.id + 1).twitter_time
    puts "========== difference ============ "
    # calculate and return time difference
    puts "Latest: " + latest.to_s
    puts "Previous: " + previous.to_s
    difference = latest - previous
    puts "Difference: " + difference.to_s
    difference
  end

  def is_stale?
    puts "============== running is_stale? method ==============="
    time_inactive = inactive_time_from_last_tweet
    if time_inactive > average_tweet_time
      puts "============= local tweet records are stale ===================="
      true
    else
      puts "============= local tweet records are fresh ===================="
      false
    end
  end

  def last_tweet_time
    puts "Twitter_time for current tweet: " + self.twitter_time.to_s
    self.twitter_time
    # TwitterUser.first.tweets[1].twitter_time
  end

  def inactive_time_from_last_tweet
    # This returns the elapsed time between
    # user's last tweet until now
    time_inactive = Time.now - last_tweet_time
    puts "time_inactive: " + time_inactive.to_s
    time_inactive
  end
end # end of class
