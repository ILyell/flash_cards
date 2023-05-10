require "./lib/round"
require "./lib/deck"
require "./lib/card"
require "./lib/turn"

RSpec.describe Round do
    
    it 'exist' do 
        
        card_1 = Card.new("What is the closest planet to the sun?", "Mercury", :STEM)
        card_2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_3 = Card.new("What is the 4th planet from the sun?", "Mars", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round).to be_a(Round)
    end
    it 'Holds a deck' do
        card_1 = Card.new("What is the closest planet to the sun?", "Mercury", :STEM)
        card_2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_3 = Card.new("What is the 4th planet from the sun?", "Mars", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round.deck).to eq(deck)
    end

    it 'Has a current card' do
        card_1 = Card.new("What is the closest planet to the sun?", "Mercury", :STEM)
        card_2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_3 = Card.new("What is the 4th planet from the sun?", "Mars", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)

        expect(round.current_card).to eq(card_1)
    end

    it 'holds turns' do
        card_1 = Card.new("What is the closest planet to the sun?", "Mercury", :STEM)
        card_2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_3 = Card.new("What is the 4th planet from the sun?", "Mars", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
    
        expect(round.turns).to eq([])
        turn_1 = round.take_turn("Mercury")
        expect(round.turns).to eq([turn_1])
        turn_2 = round.take_turn("Miami")
        expect(round.turns).to eq([turn_1, turn_2])
    end
    it 'shows number correct' do
        card_1 = Card.new("What is the closest planet to the sun?", "Mercury", :STEM)
        card_2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_3 = Card.new("What is the 4th planet from the sun?", "Mars", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        round.take_turn("Mercury")
        round.take_turn("Miami")

        expect(round.number_correct).to eq(1)
    end
    it 'shows number correct by cateogry' do
        card_1 = Card.new("What is the closest planet to the sun?", "Mercury", :STEM)
        card_2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_3 = Card.new("What is the 4th planet from the sun?", "Mars", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        round.take_turn("Mercury")
        round.take_turn("Juneau")

        expect(round.number_correct_by_category(:STEM)).to eq(1)
        expect(round.number_correct_by_category(:Geography)).to eq(1)
        round.take_turn("Mars")
        expect(round.number_correct_by_category(:STEM)).to eq(2)
    end
    it 'shows percent correct' do
        card_1 = Card.new("What is the closest planet to the sun?", "Mercury", :STEM)
        card_2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_3 = Card.new("What is the 4th planet from the sun?", "Mars", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        round.take_turn("Mercury")
        round.take_turn("Anchorage")

        expect(round.percent_correct).to eq(50.00)

        round.take_turn("Mars")

        expect(round.percent_correct).to eq(66.67)
    end
    it 'shows percent correct by category' do
        card_1 = Card.new("What is the closest planet to the sun?", "Mercury", :STEM)
        card_2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_3 = Card.new("What is the 4th planet from the sun?", "Mars", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        round = Round.new(deck)
        round.take_turn("Mercury")
        round.take_turn("Juneau")

        expect(round.percent_correct_by_category(:STEM)).to eq(100.00)
        round.take_turn("Jupiter")
        expect(round.percent_correct_by_category(:STEM)).to eq(50.00)
        expect(round.percent_correct_by_category(:Geography)).to eq(100.00)
    end

end
