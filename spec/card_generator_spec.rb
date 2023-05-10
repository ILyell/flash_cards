require "./lib/card_generator"
require "./lib/round"
require "./lib/deck"
require "./lib/card"
require "./lib/turn"

RSpec.describe do

    it 'exist' do

        cards = CardGenerator.new("./cards.txt")

        expect(cards).to be_a(CardGenerator)
    end

    xit 'loads a file' do

        cards = CardGenerator.new("./cards.txt")
        
    end
end
