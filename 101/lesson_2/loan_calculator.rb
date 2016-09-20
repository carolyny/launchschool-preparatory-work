def prompt(message)
  puts("=> #{message}")
end

loan_amount = 0
apr = 0
loan_duration = 0

prompt(" Hello, how much do you want to borrow?")

loop do
  loan_amount = gets.chomp.to_i
  if loan_amount <= 0
    prompt("please input a number greater than zero")
  else
    break
  end
end

prompt("what is the APR (as a %)?")

loop do
  apr = gets.chomp.to_f / 100
  if apr <= 0 || apr > 1
    prompt("please input a number greater than zero and less than 100")
  else
    break
  end
end

prompt("what is the loan duration in years?")
loop do
  loan_duration = gets.chomp.to_i
  if loan_duration <= 0
    prompt("please input a number greater than zero")
  else
    break
  end
end

months = (loan_duration * 12)
monthly_rate = (apr / 12)

monthly_payment = loan_amount *
                  (monthly_rate /
                  (1 - (1 + monthly_rate)**-months))

prompt("Your monthly payment is: £#{format('%02.2f', monthly_payment)}")
