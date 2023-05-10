# frozen_string_literal: true
class Round

    attr_reader :deck, :turns, :count

    def initialize(deck)
        @deck = deck
        @turns = []
        @count = 0
    end

    def take_turn(guess)
        @turns << Turn.new(guess, current_card)
        @count += 1
        @turns.last
    end
    def current_card
        deck.cards[(1 + (@count - 1))]
    end
    def number_correct
        correct = []
        @turns.each do |turn|
            correct << turn if turn.correct? == true
        end
        correct.size
    end
    def number_correct_by_category(category)
        correct_by_category = []
        @turns.each do |turn|
            correct_by_category << turn if turn.correct? == true && turn.card.category == category
        end
        correct_by_category.size
    end
    def percent_correct
        ((number_correct.to_f / turns.count.to_f) * 100).abs.ceil(2)
    end
    def percent_correct_by_category(category_2)
        total_category = []
        @turns.each do |turn|
            total_category << turn if turn.card.category == (category_2)
        end
        ((number_correct_by_category(category_2)).to_f / (total_category.size).to_f * 100).abs.ceil(2)
    end
end