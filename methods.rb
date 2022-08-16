def greet_programmer
    puts "Hello, programmer!"
end

greet_programmer

def greet name
    puts "Hello, #{name}!"
    end

greet("Ann")
greet("Naureen")

def greet_with_default(name="programmer")
    puts "Hello, #{name}!"
end

greet_with_default("Naureen")
greet_with_default()

def add num1, num2
    puts num1
    puts num2
    num1 + num2
end

puts add(1,6)

def halve num
    if num.class != Integer
      return 
    end

    num /2 
end

halve (6)