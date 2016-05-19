def factorial(n)
  total=n
  while n>1
    total=total*(n-1)
    puts total
    n=n-1
  end
  return total
end

puts "5 factorial  #{factorial(5)}"
puts "6 factorial  #{factorial(6)}"
puts "7 factorial  #{factorial(7)}"
puts "8 factorial  #{factorial(8)}"
