require 'open-uri'

class Project < ActiveRecord::Base
  belongs_to :user
  has_many :posts

  scope :by_user, ->(user_id) { where(user_id: user_id) }

  def fetch_tweets
    count = 3
    needle = '#' + self.hashtag
    tweets = $twitter.search(needle, result_type: "recent", since_id: self.since_id).take(count)
    tweets.each do |tweet|
      # Update cursor
      self.since_id = tweet.id
      self.save!

      # Create new tweets
      post = Post.new({body: tweet.text, project: self})
      #post.parse
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
