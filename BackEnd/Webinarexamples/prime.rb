def is_prime(num)
  if num == 1
    return false
  else
    (2..(num-1)).each do |i|
        if num%i == 0
          return false
        else
          return true
        end
      end
  end
end

def select_primes(array)
  result=[]
  array.each do |x|
    if x == 2
        result.push(x)

    elsif is_prime(x) == true
      result.push(x)
    end
  end
  p result
end

def select_primes2(array)
  array.select{|x| is_prime(x)}
end

p select_primes2([1,2,3,4]).count
p select_primes2([4,6,8,10]).count
