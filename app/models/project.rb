require 'open-uri'

class Project < ActiveRecord::Base
  belongs_to :user
  has_many :posts

  scope :by_user, ->(user_id) { where(user_id: user_id) }

  def fetch_tweets
    needle = '#' + self.hashtag
    options = {result_type: "recent", since_id: self.cursor}
    tweets = $twitter.search(needle, options)
    tweets.each do |tweet|
      # Update project cursor
      if self.cursor.nil? or tweet.id > self.cursor
        self.cursor = tweet.id
        self.save!
      end

      # Create new tweet
      post = Post.new(
        {
          body: tweet.text,
          project: self,
          uid: tweet.id
        }
      )
      # We do not want to parse new tweet directly
      #post.parse
      # Save new tweet
      post.save!
    end
    return tweets.count
  end

  def parse_tweets
    count = self.posts.unparsed.count
    self.posts.unparsed.each do |post|
      post.parse
    end

    return count
  end
end
