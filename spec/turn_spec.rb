require "./lib/card"
require './lib/turn'

RSpec.describe Turn do
    it 'exist' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn).to be_instance_of(Turn)
    end
    it 'has a guess' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)
        
        expect(turn.guess).to eq("Juneau")
    end
    it 'has a card' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.card).to eq(card)
    end
    it 'checks if correct' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

        expect(turn.correct?).to eq(true)
    end
    it 'gives feedback' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Juneau", card)

         expect(turn.correct?).to eq(true)
         expect(turn.feedback).to eq("Correct!")
    end
    it 'gives more feedback' do
        card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
        turn = Turn.new("Anchorage", card)

        expect(turn.correct?).to eq(false)
        expect(turn.feedback).to eq("Incorrect!")
    end
end