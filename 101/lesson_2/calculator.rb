puts "Input first number"
first_number= Kernel.gets().chomp
puts "Input second number"
second_number= Kernel.gets().chomp
puts "Input operation"
operation= Kernel.gets().chomp
case operation
when "+" then answer= first_number.to_i + second_number.to_i
when "-" then answer = first_number.to_i - second_number.to_i
when "*" then answer= first_number.to_i * second_number.to_i
when "/" then answer = first_number.to_f / second_number.to_f
else puts "you have not entered a valid operation"
end
puts answer
