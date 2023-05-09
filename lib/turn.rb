class Turn

    attr_reader :card, :question, :correct

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
        if @guess == card.answer
            @correct = true
        else
            @correct = false
        end
    end
    def feedback
        if @correct == true
            p "Correct!"
        elsif @correct == false
            p "Inncorrect!"
        end
    end
end