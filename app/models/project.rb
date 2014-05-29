class Project < ActiveRecord::Base
  belongs_to :user
  has_many :posts

  scope :by_user, ->(user_id) { where(user_id: user_id) }

  def fetch_tweets
    needle = '#' + self.hashtag
    tweets = $twitter.search(needle, :result_type => "recent").take(3)
    tweets.each do |tweet|
      urls = URI.extract(tweet.text, 'http')
      urls.each do |url|
        if url.include? 'http://'
          begin
            page = MetaInspector.new(url)
            image = page.images.to_json

            post = Post.new({body: tweet.text, image: image})
            post.project = self
            post.save
          rescue => e
            p e
          end
        end
      end
    end
  end
end
