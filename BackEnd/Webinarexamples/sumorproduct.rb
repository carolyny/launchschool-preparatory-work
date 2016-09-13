def sumproduct
  puts "Please enter a number greater than 0"
  number=gets.chomp.to_i
  puts "please enter s for a sum or p for a product"
  calc=gets.chomp

  if calc=="s"
    sum=0
    while number>0
      sum=sum+number
      number-=1
    end
    answer=sum
  elsif calc=="p"
    product=1
    while number>0
      product=product*number
      number-=1
    end
    answer=product
  end

p answer
end

sumproduct
