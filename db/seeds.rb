Category.delete_all

['Art and Photography', 'Business', 'Crafts and Hobbies', 'Design', 'Education', 'Games', 'Health and Fitness', 'Humanities', 'Languages', 'Lifestyle', 'Math and Science', 'Music', 'Social Sciences', 'Sports', 'Technology', 'Other'].each do |category|
	Category.create({:name => category})
  puts "Created category '#{category}'"
end

Level.delete_all

['1', '2', '3', '4', '5'].each do |level|
	Level.create({:number => level})
  puts "Created level '#{level}'"
end