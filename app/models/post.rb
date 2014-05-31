class Post < ActiveRecord::Base
  belongs_to :project
  belongs_to :parser

  def parser_name
    if parser.nil?
      '---unknown---'
    else
      parser.name
    end
  end
end
