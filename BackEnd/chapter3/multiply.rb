
def multiply(first_number, second_number)
  puts "The answer is #{first_number*second_number}"
end

puts "enter first numer"
first_number = gets.chomp.to_i
puts "enter second numer"
second_number = gets.chomp.to_i

multiply(first_number, second_number)
