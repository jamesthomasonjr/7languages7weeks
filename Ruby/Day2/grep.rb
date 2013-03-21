puts "Please give me a file to search!"
filename = gets.chomp #strip newline from the end!
filepath = File.absolute_path(filename)
if File.exists?(filepath)
  puts "Please give me a string to search for!"
  search = gets.chomp
  puts
  file = File.new(filepath, "r")
  results = file.grep(/#{search}/)
  puts "The following lines have '#{search}' in them!"
  puts "============================================="
  results.each { |result| puts result }
else
  puts "Sorry, #{filename} doesn't exist!"
end
