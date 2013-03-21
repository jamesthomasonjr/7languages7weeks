numbers = (1..16).to_a
output = []
numbers.each do |value|
  output.push(value)
  if output.length == 4
    puts "[#{output[0]}, #{output[1]}, #{output[2]}, #{output[3]}]"
    output.clear
  end
end
