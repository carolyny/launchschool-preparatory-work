

h1 = {a:1, b:2, c:3, d:4}
puts h1

h2 = {:e=>10,:f=>20, :g=>30}

puts h2

puts h1[:b]

h1[:e]=5

puts h1

puts h1.select{|k,v| v<3.5}
puts h1.delete_if{|k,v| v<3.5}
