class Post < ActiveRecord::Base
  belongs_to :project, counter_cache: true
  belongs_to :parser

  default_scope { order('id DESC') }
  scope :unparsed, -> { where(image: nil) }
  scope :pretty, -> { where.not(image: nil).where.not(image: "").limit(30) }

  def parser_name
    if parser.nil?
      '---unknown---'
    else
      parser.name
    end
  end

  def parse
    progress = []
    urls = URI.extract(body, 'http')
    urls.each do |url|
      if url.include? 'http://'
        begin
          response = ''
          # TODO: Ugly! Some lambda function maybe?
          final_uri = ''
          open(url, :allow_redirections => :safe) do |h|
            response = h.read
            final_uri = h.base_uri.to_s
          end
          progress << "URL: " + final_uri
          url = final_uri

          domain = URI.parse(url).host
          parser = Parser.where({domain: domain}).first_or_create
          xpath = parser.xpath
          puts parser.xpath
          puts domain
          image = Nokogiri::HTML(response).xpath(xpath).to_s
          progress << "Image: " + image

          self.image = image
          self.parser = parser
          self.save!
          break # It's ok, we already have some image
        rescue => e
          progress << "Error: " + e.to_s
        end
      end
    end
    return progress
  end
end
