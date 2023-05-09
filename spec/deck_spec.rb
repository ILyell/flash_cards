require "./lib/card"
require "./lib/deck"

RSpec.describe do

    it "stores cards" do
        card_1 = Card.new("What is the closest planet to the sun?", "Mercury", :STEM)
        card_2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_3 = Card.new("What is the 4th planet from the sun?", "Mars", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)

        expect(deck.cards).to eq(cards)
    end

    it "will count the cards" do
        card_1 = Card.new("What is the closest planet to the sun?", "Mercury", :STEM)
        card_2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_3 = Card.new("What is the 4th planet from the sun?", "Mars", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)
        
        expect(deck.count).to eq(3)
    end

    it "will show cards in a category" do
        card_1 = Card.new("What is the closest planet to the sun?", "Mercury", :STEM)
        card_2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        card_3 = Card.new("What is the 4th planet from the sun?", "Mars", :STEM)
        cards = [card_1, card_2, card_3]
        deck = Deck.new(cards)

        expect(deck.cards_in_category(:STEM)).to eq([card_1, card_3])
    end
end