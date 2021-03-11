class CLI

    def run
        # Greet out user
        puts "Welcome to the Star Wars Character Lister"
        # Tell them what to do
        puts "Please choose a Character"
        # Call our scrape character method
        API.load_characters
        # Call a list characters method
        list_characters
        menu
    end

    def list_characters
        # Call our Character level all variable and loop through it to list the characters
        Character.all.each.with_index(1) do | char, i |
            puts "#{i}. #{char.name}"
        end
    end


    def menu
        puts "Please select a number to see more information:"
        input = gets.chomp
        # make sure the users input is good
        if !input.to_i.between?(1, Character.all.count)
            list_characters
            menu
        else
            character = Character.all[input.to_i-1]
            display_character_details(character)
        end
        


    end


    def display_character_details(character)
        API.load_character_details(character)
        puts "Here are the details for #{character.name}:"
        puts "Height: #{character.height}"
        puts "Mass: #{character.mass}"
        puts "Hair Color: #{character.hair_color}"
        puts "Skin Color: #{character.skin_color}"
        puts "Eye Color: #{character.eye_color}"
    end

end