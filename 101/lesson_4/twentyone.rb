require "pry"

GAME_TARGET = 21
DEALER_HIT_VALUE = 17

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  system "cls" || system('clear')
  suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
  ranks = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10"] +
          ["Jack", "Queen", "King"]
  deck = []
  suits.each do |suit|
    ranks.each do |rank|
      deck << [suit, rank]
    end
  end
  deck.shuffle!
end

def display_cards(cards)
  card_string = ""
  string = ""
  last_card = []
  last_card[0] = cards.last
  cards.each do |card|
    card_string += string
    string = "#{card[1]} of #{card[0]}, "
  end
  card_string.chop.chop + " and #{last_card[0].reverse.join(' of ')}"
end

def total(cards)
  values = cards.map { |card| card[1] }
  sum = 0
  values.each do |value|
    sum += if value == "Ace"
             11
           elsif value.to_i.zero?
             10
           else
             value.to_i
           end
  end
  values.select { |value| value == "Ace" }.count.times do
    sum -= 10 if sum > GAME_TARGET
  end
  sum
end

def busted?(cards)
  total(cards) > GAME_TARGET
end

def identify_winner(dealer_cards, player_cards)
  if busted?(player_cards)
    :player_busted
  elsif busted?(dealer_cards)
    :dealer_busted
  elsif total(dealer_cards) < total(player_cards)
    :player
  elsif total(dealer_cards) > total(player_cards)
    :dealer
  else
    :draw
  end
end

def display_winner(dealer_cards, player_cards)
  winner = identify_winner(dealer_cards, player_cards)
  case winner
  when :player_busted then puts "You busted, dealer wins"
  when :dealer_busted then puts "Dealer busted, you win"
  when :player then puts "You won"
  when :dealer then puts "Dealer won"
  when :draw then puts "It's a draw"
  end
end

def hit(deck, cards)
  cards << deck.pop
end

player_score = 0
dealer_score = 0

loop do
  deck = initialize_deck
  player_cards = []
  dealer_cards = []
  player_total = ""
  dealer_total = ""

  prompt "Hello  -  Welcome to Twenty-One"
  2.times do
    hit(deck, player_cards)
    hit(deck, dealer_cards)
  end
  player_total = total(player_cards)
  dealer_total = total(dealer_cards)
  prompt "Your cards are #{display_cards(player_cards)}, "
  puts "and your total is #{player_total}"
  prompt "The dealer's first card is #{dealer_cards[0].reverse.join(' of ')}"

  answer = ""
  prompt "you have won #{player_score} games," \
         " the dealer has won #{dealer_score} games"
  loop do
    loop do
      prompt "Would you like to hit (h) or stay (s)?"
      answer = gets.chomp
      break if answer == "s" || answer == "h"
      prompt "Not a valid input, please try again"
    end
    if answer == "h"
      hit(deck, player_cards)
      player_total = total(player_cards)
      system "cls" || system('clear')
      prompt "Your cards are now #{display_cards(player_cards)}"
      prompt "Your total is #{player_total}"
      prompt "The dealer's first card is " \
             "#{dealer_cards[0].reverse.join(' of ')}"
    end
    break if busted?(player_cards) || answer == "s"
  end

  loop do
    if busted?(player_cards)
      break
    elsif dealer_total >= DEALER_HIT_VALUE || busted?(dealer_cards)
      break
    end
    hit(deck, dealer_cards)
    dealer_total = total(dealer_cards)
  end

  prompt "The dealer's total is #{dealer_total}"
  prompt "The dealer's cards were #{display_cards(dealer_cards)}"
  puts""
  prompt "Your total is #{player_total}"
  prompt "Your cards were #{display_cards(player_cards)}"
  puts""
  display_winner(dealer_cards, player_cards)
  if identify_winner(dealer_cards, player_cards) == :dealer_busted ||
     identify_winner(dealer_cards, player_cards) == :player
    player_score += 1
  elsif identify_winner(dealer_cards, player_cards) == :player_busted ||
        identify_winner(dealer_cards, player_cards) == :dealer
    dealer_score += 1
  end
  prompt "you have won #{player_score} games," \
         " the dealer has won #{dealer_score} games"
  break if player_score == 5 || dealer_score == 5
  prompt "Would you like to play again? (y or any other key to exit)"
  answer = gets.chop
  break unless answer.casecmp('y').zero?
end

if player_score == 5
  prompt "you have won 5 games - you are the winner"
elsif dealer_score == 5
  prompt "dealer has won 5 games - the dealer is the winner"
else
  prompt "Thanks for playing. Good bye"
end
