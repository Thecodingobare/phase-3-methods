#METHODS
#Why are they called methods in Ruby as opposed to functions? If you recall from Object Oriented JavaScript, the difference between a method and a function is that a method is a special sub-category of functions that must be called on some object. In Ruby, every method we define — even when it's not defined explicitly "on an object" or as part of a class definition — is still actually defined on a built-in Ruby object: the global main object, which you'll see referenced in error messages like "NameError (undefined local variable or method 'my_var' for main:Object)". main is roughly equivalent to the global object in JavaScript (the window in the browser); you can see for yourself by entering IRB and typing self. Read more about Ruby's Main Object here (Links to an external site.) if you're curious!

#Parenthesis are optional in methods
#In certain contexts, removing parentheses from the method calls can make your code more pleasant to look at. You might also see some Domain Specific Languages (DSLs) that prefer to omit parentheses. You've probably already seen a little bit of RSpec's DSL in the test files, for example:

describe "MyRubyThing" do
    it "runs" do
      # test here
    end
  end

  #describe and #it are just methods, so the above could have been written:

  describe("MyRubyThing") do
    it("runs") do
      # test here
    end
  end

  #What does the keyword do do in Ruby 

  [1, 2, 3].each do |n|
    puts n
  end
#   1
#   2
#   3

[1, 2, 3].each_with_index do |n, i|
    puts "Index: #{i}, Value: #{n}"
  end

# Index: 0, Value: 1
# Index: 1, Value: 2
# Index: 2, Value: 3

#Default Arguments

def say_hi(name = "Rubyist")
    puts "Hi there, #{name}!"
  end
  
  say_hi
  # => "Hi there, Rubyist!"
  
  say_hi "Sunny"
  # => "Hi there, Sunny!"

#Return Values

# You can categorize all functions that you write as generally useful for one (or both) of these things:

# What return value they have
# What side effects they have (what other parts of the application they change; or what they output to the terminal; or what they write to a file; etc)
# Writing output to the terminal using console.log or #puts is a side effect of a function: it's distinct from the function's return value.

#Ruby behaves just like javascript

def add_and_log(num1, num2)
    puts num1 + num2
  end
  
  def add_and_return(num1, num2)
    return num1 + num2
  end
  
  sum1 = add_and_log(2, 2)
  # => nil
  sum2 = add_and_return(2, 2)
  # => 4

  #To both print and return your name, you could write:

def print_and_return_name
  puts "Bob Ross"
  "Bob Ross"
end

#If you accidentally switched the order of the lines inside the method:

def broken_print_and_return_name
  "Bob Ross"
  puts "Bob Ross"
end

#The Return Keyword
#If you accidentally switched the order of the lines inside the method:

def broken_print_and_return_name
    "Bob Ross"
    puts "Bob Ross"
  end
  #The method would instead print "Bob Ross" and return nil. This is because the last line that was evaluated was puts ... and the return value of a #puts is always nil.
  
  

#There is one other way to return a value from a method, and that is to use the return keyword.

def stylish_painter
    best_hairstyle = "Bob Ross"
    return "Jean-Michel Basquiat"
    best_hairstyle
  end
# It returns:
# "Jean-Michel Basquiat" 

#You may have expected the return value to be Bob Ross. His name is the last line of the method. However, the return value of the above method is actually Jean-Michel Basquiat! The return keyword will disrupt the execution of your method, and prevent Ruby from running any lines of code after the return keyword.

#The explicit use of the return keyword is generally avoided by many Rubyists, but there are instances where you might want to use return instead of relying on implicit returns; for example, if we wanted to use a guard clause (Links to an external site.) and exit a function early if a certain condition isn't met:

def reverse_name(name)
    if name.class != String
      return nil
    end
  
    name.reverse
  end
  
  reverse_name("Bob Ross")
  # => "ssoR boB"
  reverse_name(123)
  # => nil