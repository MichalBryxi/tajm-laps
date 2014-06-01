desc "Fetch tweets"
task :fetch_tweets => :environment do
  puts "Fetching tweets"
  Project.all.each do |project|
    fetched = project.fetch_tweets
    puts project.name + ": " + fetched.to_s
  end
  puts "Done"
end

desc "Parse tweets"
task :parse_tweets => :environment do
  puts "Parsing tweets"
  Project.all.each do |project|
    parsed = project.parse_tweets
    puts project.name + ": " + parsed.to_s
  end
  puts "Done"
end