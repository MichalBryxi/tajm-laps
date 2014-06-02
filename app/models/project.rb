require 'open-uri'

class Project < ActiveRecord::Base
  belongs_to :user
  has_many :posts

  scope :by_user, ->(user_id) { where(user_id: user_id) }

  def fetch_tweets
    count = 3
    needle = '#' + self.hashtag
    options = {result_type: "recent", count: count}
    options[:since_id] = self.since_id unless self.since_id.nil?
    options[:max_id] = self.max_id unless self.max_id.nil?
    tweets = $twitter.search(needle, options)
    puts "------" + tweets.count.to_s
    p options
    tweets.each do |tweet|
      puts "tweet.id: " + tweet.id.to_s
      # Update cursor
      self.since_id = tweet.id if (self.since_id.nil? or self.since_id > tweet.id)
      self.max_id = tweet.id if (self.max_id.nil? or self.max_id > tweet.id)
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
