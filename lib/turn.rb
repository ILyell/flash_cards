class Turn

    attr_reader :card, :question

    def initialize(guess, card)
        @guess = guess
        @card = card
    end

    def guess
        @guess
    end
    def card
        @card
    end
    def correct?
        true if @guess == card.answer
    end
    def feedback
        if @guess == card.answer
            p "Correct!"
        else
            p "Incorrect!"
        end
    end
end