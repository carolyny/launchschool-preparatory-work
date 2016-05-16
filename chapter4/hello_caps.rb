
def caps(string)
  if string.length>=10
    puts string.upcase
    return string.upcase
  else
    puts "#{string} is less than 10 characters"
  end
end

caps("hello world")
caps("hello")
