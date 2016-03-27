class Api::V1::ProjectResource < JSONAPI::Resource
  attributes :name, :description, :hashtag, :image, :posts_count, :cursor, :latitude, :longitude

  has_many :posts
end
