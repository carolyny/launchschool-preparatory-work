def countdown (number)
  puts number
  unless number==0
    number = number-1
    countdown (number)
  end
end

puts "enter a start value for the countdown"
number =gets.chomp.to_i
countdown (number)
