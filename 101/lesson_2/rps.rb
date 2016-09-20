VALID_CHOICE = %w(rock paper scissors)

def prompt(message)
  puts("=> #{message}")
end

choice = ''

loop do
  loop do
    prompt('Please enter a choice: rock, paper or scissors')
    choice = gets.chomp
    if VALID_CHOICE.include?(choice)
      break
    else
      prompt('That is not a valid choice')
    end
  end

  computer_choice = VALID_CHOICE.sample

  puts "you chose #{choice}, computer chose #{computer_choice}"

  if  (choice == "paper" && computer_choice == "rock") ||
      (choice == "rock" && computer_choice == "scissors") ||
      (choice == "scissors" && computer_choice == "paper")
      then prompt("you win")
  elsif (choice == "scissors" && computer_choice == "rock") ||
        (choice == "paper" && computer_choice == "scissors") ||
        (choice == "rock" && computer_choice == "paper")
        then prompt("computer wins")
  else prompt("its a tie")
  end
  prompt('do you wish to go again?')
  break unless gets.chomp.downcase.start_with?("y")
end
