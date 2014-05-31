class Post < ActiveRecord::Base
  belongs_to :project
  belongs_to :parser
end
