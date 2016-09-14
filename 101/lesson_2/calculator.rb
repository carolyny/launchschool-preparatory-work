# First attempt before going through video.   to_f method was only addition after video

# puts "Input first number"
# first_number= Kernel.gets().chomp
# puts "Input second number"
# second_number= Kernel.gets().chomp
# puts "Input operation"
# operation= Kernel.gets().chomp
# case operation
# when "+" then answer= first_number.to_i + second_number.to_i
# when "-" then answer = first_number.to_i - second_number.to_i
# when "*" then answer= first_number.to_i * second_number.to_i
# when "/" then answer = first_number.to_f / second_number.to_f
# else puts "you have not entered a valid operation"
# end
# puts answer

def prompt(message)
 Kernel.puts("=> #{message}")
end

def is_valid(num)
  num.to_i != 0
end

def operation_to_message(op)
  case op
  when "+"
    "Adding"
  when "-"
    "Subtracting"
  when "*"
    "Multiplying"
  when "/"
    "Dividing"
  end
end

prompt(" Hello, what is your name?")

name =""

loop do
  name=Kernel.gets().chomp()
  if name.empty?()
    prompt("please enter your name")
  else
    break
  end
end

prompt("Hi, #{name}")

loop do
  first_number =""

  loop do
    prompt("Input first number")
    first_number= Kernel.gets().chomp()
    if is_valid(first_number)
      break
    else
      prompt("that isn't a valid number")
    end
  end

  second_number =""

  loop do

  prompt("Input second number")
  second_number= Kernel.gets().chomp()
    if is_valid(second_number)
      break
    else
      prompt("that isn't a valid number")
    end
  end


  operation_prompt = <<-MSG
    What operation would you like to perform?
    +
    -
    *
    /
  MSG

  prompt(operation_prompt)

  operation =""

  loop do
    operation= Kernel.gets().chomp()

    if %w(+ - * /).include?(operation)
      break
    else
      prompt "enter either + - * or /"
    end
  end

  prompt("#{operation_to_message(operation)} the two numbers")

  answer = case operation
  when "+" then answer = first_number.to_i + second_number.to_i
  when "-" then answer = first_number.to_i - second_number.to_i
  when "*" then answer = first_number.to_i * second_number.to_i
  when "/"  then answer = first_number.to_f / second_number.to_f
  end

  prompt("the answer is #{answer}")

  prompt("do you want to calculate again?  (Y to calculate)")

  unless Kernel.gets().chomp().downcase == "y"
    break
  end

end

prompt("thank you")
