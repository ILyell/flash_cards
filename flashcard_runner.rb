require "./lib/round"
require "./lib/deck"
require "./lib/card"
require "./lib/turn"

cards = []

File.foreach("cards.txt") do |line|
    split_line = line.split(",")
    cards << Card.new((split_line[0].to_s.strip), (split_line[1].to_s.strip), (split_line[2].to_s.strip))
end

deck = Deck.new(cards)
round = Round.new(deck)


p "Welcome! You're playing with #{round.deck.count} cards."
p "---------------------------------------------------"

(round.deck.count).times do
    p "This is card number #{round.count + 1} out of #{round.deck.count}"
    p "Question: #{round.current_card.question}"
    round.take_turn(gets.chomp)
    round.turns[-1].feedback
end

p "****** Game over! ******"
p "You had #{round.number_correct} correct guesses out of #{round.deck.count} for a total score of #{round.percent_correct}%."
categories = []
round.deck.cards.select do |card|
    categories << card.category
end

cate_uniq = categories.uniq

(cate_uniq.size).times do
    cate = cate_uniq.shift
    p "#{cate[1..-1]} - #{round.percent_correct_by_category(cate)}"
end