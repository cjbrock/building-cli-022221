class API

    def self.load_characters
        resp = RestClient.get('https://swapi.dev/api/people/')
        star_wars_hash = JSON.parse(resp.body, symbolize_names: true)
        star_wars_array = star_wars_hash[:results]

        character = star_wars_array.collect do | char |
            Character.new(char)
        end
    end

    # get individual character info when requested

    def self.load_character_details(character)
        resp = RestClient.get(character.url)
        char_hash = JSON.parse(resp.body, symbolize_names: true)
        character.height = char_hash[:height]
        character.mass = char_hash[:mass]
        character.hair_color = char_hash[:hair_color]
        character.skin_color =char_hash[:skin_color]
        character.eye_color = char_hash[:eye_color]
    end

end