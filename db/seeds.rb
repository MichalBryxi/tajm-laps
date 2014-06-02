# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

parsers = [
  { name: 'twitter.com', domain: 'twitter.com', xpath: '//img[@alt="Embedded image permalink"]/@src' },
  { name: 'shots.me', domain: 'shots.me', xpath: '//*[@id="solo"]/div[1]/div[1]/img/@src' },
  { name: 'instagram.com', domain: 'instagram.com', xpath: '/html/head/meta[8]/@content' }
]

parsers.each do |parser|
  Parser.find_or_create_by_domain(parser)
end
