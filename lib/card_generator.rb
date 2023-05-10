class CardGenerator

    attr_reader :cards

    def initialize(file_name)
        @cards = []
        File.foreach(file_name) do |line|
            split_line = line.split(",")
            cards << Card.new((split_line[0].to_s.strip), (split_line[1].to_s.strip), (split_line[2].to_s.strip))
        end
    end
end



