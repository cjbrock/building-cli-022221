class Character

    attr_accessor :name, :url, :height, :mass, :hair_color, :skin_color, :eye_color

    @@all = []

    def initialize(char)
        @name = char[:name]
        @url = char[:url]
        @@all << self
    end

    def self.all
        @@all
    end

end