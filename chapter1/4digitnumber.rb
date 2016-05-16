puts "Choose a number?"
number=gets.chomp.to_i
thousands=number/1000
puts "thousands #{thousands}"
hundreds=number%1000/100
puts "hundreds #{hundreds}"
tens=number%100/10
puts "tens #{tens}"
ones=number%10
puts "ones #{ones}"
