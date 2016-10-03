PLAYER = "X"
COMPUTER = "O"
EMPTY = " "

require "pry"

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system "cls"
  puts "    |     |"
  puts " #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "    |     |"
  puts "----+-----+---- "
  puts "    |     |"
  puts " #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "    |     |"
  puts "----+-----+----- "
  puts "    |     |"
  puts " #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "    |     |"
end

def initialze_board
  new_board = {}
  (1..9).each { |num| new_board[num] = " " }
  new_board
end

def player_places(brd)
  square = " "
  loop do
    prompt "Choose a square to place an X: #{empty_squares(brd).join(", ")}?"
    square = gets.chomp.to_i
    if brd.keys.select { |num| brd[num] == " " }.include?(square)
      break
    else
      prompt "sorry not a valid input"
    end
  end
  brd[square] = PLAYER
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == " " }
end

def computer_places(brd)
  if offensive_move_required?(brd)
    square = identify_offensive_move(brd)
  elsif defensive_move_required?(brd)
    square = identify_defensive_move(brd)
  else
    square = empty_squares(brd).sample
  end
  brd[square] = COMPUTER
end

def board_full?(brd)
  empty_squares(brd) == []
end

def someone_wins?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  winning_lines.each do |line|
    if brd[line[0]] == PLAYER &&
       brd[line[1]] == PLAYER &&
       brd[line[2]] == PLAYER
      return 'Player'
    elsif brd[line[0]] == COMPUTER &&
       brd[line[1]] == COMPUTER &&
       brd[line[2]] == COMPUTER
      return 'Computer'
    end
  end
  nil
end

def defensive_move_required?(brd)
  !!identify_defensive_move(brd)
end

def identify_defensive_move(brd)
  winning_lines = [[4, 5, 6],[1,2, 3],[7,8,9]]+
                  [[1,4,7],[2,5,8],[3,6,9]] +
                  [[1,5,9],[3,5,7]]

   winning_lines.each do |line|
    if brd[line[0]] == "X" && brd[line[1]] == "X" && brd[line[2]] == " "
      return square = line[2]
    elsif brd[line[0]] == " " && brd[line[1]] == "X" && brd[line[2]] == "X"
      return square = line[0]
    elsif brd[line[0]] == "X" && brd[line[1]] == " " && brd[line[2]] == "X"
      return square = line[1]
    end
  end
  nil
end

def offensive_move_required?(brd)
  !!identify_offensive_move(brd)
end

def identify_offensive_move(brd)
  winning_lines = [[4, 5, 6],[1,2, 3],[7,8,9]]+
                  [[1,4,7],[2,5,8],[3,6,9]] +
                  [[1,5,9],[3,5,7]]

   winning_lines.each do |line|
    if brd[line[0]] == "O" && brd[line[1]] == "O" && brd[line[2]] == " "
      return square = line[2]
    elsif brd[line[0]] == " " && brd[line[1]] == "O" && brd[line[2]] == "O"
      return square = line[0]
    elsif brd[line[0]] == "O" && brd[line[1]] == " " && brd[line[2]] == "O"
      return square = line[1]
    end
  end
  nil
end

loop do
  board = initialze_board
  display_board(board)
  player_wins = 0
  computer_wins = 0

  loop do
    player_places(board)
    display_board(board)
    if board_full?(board) || someone_wins?(board)
      break
    else
      computer_places(board)
      display_board(board)
    end

    if board_full?(board) || someone_wins?(board)
      break
    end
  end

  if someone_wins?(board)
    prompt "#{detect_winner(board)} won"
    if someone_wins?(board) == "Player"
      then player_wins =+1
    elsif someone_wins?(board) == "Computer"
      then computer_wins =+1
    end
    binding.pry
  else
    prompt "It's a tie"
  end
  prompt "Score is: player wins #{player_wins}, computer wins #{computer_wins}"
  if player_wins == 5 || computer_wins == 5
    break
  else
  prompt"Play again y?"
    if gets.chomp.downcase != "y"
      break
    end
  end

end
