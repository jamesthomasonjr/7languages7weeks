# "Hello, World" in Ruby

class Greeter
   def initialize(name)
      @name = name.capitalize
   end
   def sayHello
      puts "Hello #{@name}!"
   end
end

greeter = Greeter.new("World")
greeter.sayHello
