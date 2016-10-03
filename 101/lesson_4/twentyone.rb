require "pry"

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  system "cls"
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
    if value == "Ace"
      sum += 11
    elsif value.to_i.zero?
      sum += 10
    else
      sum += value.to_i
    end
  end
  values.select { |value| value == "Ace" }.count.times do
    sum -= 10 if sum > 21
  end
  sum
end

def busted?(cards)
  total(cards) > 21
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

loop do
  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  prompt "Hello  -  Welcome to Twenty-One"
  hit(deck, player_cards)
  hit(deck, dealer_cards)
  hit(deck, player_cards)
  hit(deck, dealer_cards)
  prompt "Your cards are #{display_cards(player_cards)}"
  prompt "The dealer's first card is #{dealer_cards[0].reverse.join(' of ')}"

  total(player_cards)
  total(dealer_cards)
  answer = ""
  loop do
    loop do
      prompt "Would you like to hit (h) or stay (s)?"
      answer = gets.chomp
      if answer == "s"
        break
      elsif answer == "h"
        hit(deck, player_cards)
        prompt "Your cards are now #{display_cards(player_cards)}"
        break if busted?(player_cards)
      else
        prompt "Not a valid input, please try again"
      end
    end
    break if busted?(player_cards) || answer == "s"
  end

  loop do
    if busted?(player_cards)
      break
    elsif total(dealer_cards) >= 17 || busted?(dealer_cards)
      break
    else
      loop do
        if total(dealer_cards) >= 17 || busted?(dealer_cards)
          break
        else
          hit(deck, dealer_cards)
        end
      end
    end
  end

  prompt "The dealer's total is #{total(dealer_cards)}"
  prompt "The dealer's cards were #{display_cards(dealer_cards)}"
  puts""
  prompt "Your total is #{total(player_cards)}"
  prompt "Your cards were #{display_cards(player_cards)}"
  puts""
  display_winner(dealer_cards, player_cards)

  prompt "Would you like to play again? (y or any other key to exit)"
  answer = gets.chop
  break unless answer.casecmp('y').zero?
end

prompt "Thanks for playing. Good bye"
