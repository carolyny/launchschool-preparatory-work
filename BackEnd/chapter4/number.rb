def numberrange(number)

  if number <=50
    puts "#{number} is between 0 and 50"
  elsif number<=100
    puts "#{number} is between 51 and 100"
  else
    puts "#{number} is over 100 - you were meant to input one between 0 and 100!"
  end
end

puts "enter a number between 0 and 100"
number=gets.chomp.to_i
numberrange(number)
