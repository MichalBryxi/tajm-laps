require 'open-uri'

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
            response = RestClient.get(url)
            #  { |response, request, result, &block|
            #   if [301, 302, 307].include? response.code
            #     response.follow_redirection(request, result, &block)
            #   else
            #     response.return!(request, result, &block)
            #   end
            # }
            final_uri = ''
            open(url) do |h|
              final_uri = h.base_uri.to_s
            end
            url = final_uri

            domain = URI.parse(url).host
            parser = Parser.where({domain: domain}).first
            xpath = parser.xpath

            puts response.to_s
            puts "----------"
            image = Nokogiri::HTML(response.to_str).xpath(xpath).to_s
            puts image
            # page = MetaInspector.new(url)
            # image = page.images.to_json

            post = Post.new({body: tweet.text, image: image})
            post.project = self
            post.parser = parser
            post.save
          rescue => e
            p e
          end
        end
      end
    end
  end
end
