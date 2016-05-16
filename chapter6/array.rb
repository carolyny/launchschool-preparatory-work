arr1 = [1, 3, 5, 7, 9, 11]
arr2=[]
arr1.each do |x|
  x=x+2
  arr2.push(x)
end
p arr1
p arr2

puts "here is the map version"
p arr1.map{|y| y+2}
