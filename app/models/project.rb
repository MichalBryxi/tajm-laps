class Project < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  def fetch
    puts ">>> Fetching #{self.hashtag} since #{self.cursor}"
    i = 0
    needle = '#' + self.hashtag
    options = {result_type: "recent", since_id: self.cursor}
    tweets = $twitter.search(needle, options)
    tweets.each do |tweet|
      i = i + 1
      break if i > 10

      if self.cursor.nil? or tweet.id > self.cursor
        puts "Moved cursor to #{tweet.id}"
        self.cursor = tweet.id
        self.save!
      end

      puts "Creating new post with body: #{tweet.text}"
      post = Post.create({
        body: tweet.text,
        project: self
      })
      post.save!

      sleep 1
    end

    puts "<<< Found #{i} new posts"
  end

  def parse
    puts ">>> Parsing #{self.hashtag}"
    i = 0

    self.posts.unparsed.each do |post|
      i += 1
      post.parse

      sleep 1
    end

    return "<<< Parsed #{i} posts"
  end
end
