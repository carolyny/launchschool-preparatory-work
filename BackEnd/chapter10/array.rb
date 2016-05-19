array1=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

array1.each{|num| puts num}

array1.each do |num|
  if num>5
    puts num
  else
  end
end

array1.each do |num|
  puts num if num>5
end



array1.select do |num|
  if num.odd?
    puts num
  else
  end
end

array1.push(11)
array1.unshift(0)

array1.each{|num| puts num}

array1.pop
array1.push(3)
array1.each{|num| puts num}

puts array1.uniq
