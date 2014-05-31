require 'open-uri'

class Project < ActiveRecord::Base
  belongs_to :user
  has_many :posts

  scope :by_user, ->(user_id) { where(user_id: user_id) }

  def fetch_tweets
    needle = '#' + self.hashtag
    tweets = $twitter.search(needle, :result_type => "recent").take(3)
    tweets.each do |tweet|
      post = Post.new({body: tweet.text, project: self})
      post.save

      post.parse
    end
  end
end
