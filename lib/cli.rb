class Cli 
    def main_menu
        #add a title Poke Fight
        puts "What do you want to choose?" 
        puts "1. New Game\n2. Exit"
        player_choice = gets.chomp.downcase 
        if player_choice == "1" 
            start
        elsif player_choice == "2"
            exit 
        else
            puts "Invalid choice, please choose again!"
            main_menu                        
        end
    end
    
    def start
        puts "Which Pokemon do you prefer"
        puts "1. Abra\n2. Pikachu" 
        poke_choice = gets.chomp.downcase
        #User include? enumerable to check if it actually exists in the api
        if poke_choice == "pikachu" || poke_choice == "abra"
        player = PokeApi.get(pokemon: "#{poke_choice}")
        location
        else puts "It's not a valid choice, please choose again"
            start 
        end       
    end 

    ## location that player prefers
    def location 
        puts "Which location would you like to challege?" 
        puts "1. Volcano\n2. Pond"
        location_choice = gets.chomp.downcase 
        if location_choice == "1" || location_choice == "volcano" 
            puts "Welcome to the Vocalno world!"
            volcano_battle
        elsif location_choice == "2" || location_choice == "Pond"
            puts "Welcome to the Vocalno world!"
            pond_battle
        else puts "Not a valid choice"
            location 
        end 
    end

    # def volcano_battle 
    #     puts "READY TO FIGHT!!!"
    #     puts "#{poke_choice}: #{poke_choice.hp} vs #{enemy_choice}: #{enemy_choice.hp}"
    #     while poke_choice.hp > 0
    #         enemy_damage = rand(1..poke_choice.attack) 
    #         puts enemy_damage
    #         enemy_choice.hp = enemy_choice.hp - damage
    #         puts enemy_choice.hp
    #         enemy 
    #     end 
    # end 


    # def pokemon 
    #     while poke_choice.hp > 0
    #         enemy_damage = rand(1..poke_choice.attack) 
    #         puts enemy_damage
    #         enemy_choice.hp = enemy_choice.hp - damage
    #         puts enemy_choice.hp
    #         enemy 
    #     end 
    # end  


    # def enemy 
    #     while poke_choice.hp > 0
    #         enemy_damage = rand(1..poke_choice.attack) 
    #         puts enemy_damage
    #         enemy_choice.hp = enemy_choice.hp - damage
    #         puts enemy_choice.hp
    #         enemy 
    #     end 
    # end 




    #     poke_choice.hp = poke_choice.hp - rand(1..enemy_choice.attack)
    #     if pokemon.hp == 0 
    #         "Game Over!!!"
    #     enemy 
    #     if pokemon.hp == 0 
    #         "Game Over!!!"
    #     end 

end 


