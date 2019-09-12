class Cli 
    def self.main_menu
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

    def self.poke_names 
        Pokemon.all.map{|poke| poke["name"]}
    end 

    def self.poke_attacks
        Attack.all.map{|poke| poke["name"]}
    end 

    
    def self.start
        puts "Which Pokemon do you prefer?"        
        poke_names.each{|poke| puts "#{poke_names.index(poke) + 1}. #{poke}"}
        player_choice
    end 

    def self.player_choice
        play_choice = gets.chomp.downcase.to_i   #player choice is from 1-20
        if (1..poke_names.length).include?(play_choice)
            play_poke = poke_names.find{|poke| poke[play_choice-1] == play_choice}
            puts "#{play_choice}. #{poke_names[play_choice-1]}" 
            enemy_choice
            # location 
            battle
        else  
            puts "Please choose again, it's not a valid option!"
            player_choice
        end 

    end 

    def self.enemy_choice 
        enemy_choice = rand(1..poke_names.length)
        puts "Your enemy is #{poke_names[enemy_choice-1]}"
        enemy_poke = poke_names.find{|poke| poke[enemy_choice-1] == enemy_choice}
    end 


    def self.location 
        puts "Please choose the location?\n 1.Deathly Volcano\n 2.Frosbite Cave\n 3.Far Future\n 4.Bigwave Beach"
        # location_choice = gets.chomp.lowercase 
        battle
    end 

    def self.player_turn 
    puts "What attack would you like to choose?"
        puts poke_attacks.map{|attack| "#{poke_attacks.index(attack) + 1}. #{attack}"}
        play_attack_choice = gets.chomp.downcase 
        player_hp = player_hp - rand(10..enemy_hp)
        puts "your health is #{player_hp} hp remaining"
    end 

    def self.enemy_turn 
        puts "Your enemy chooses #{poke_attacks[rand(0..poke_attacks.length-1)]}"
        player_hp -= rand(10..enemy_damage)
        puts "your enemy's health is #{player_hp} hp remaining"
    end         

    def self.player_hp
        Pokemon.all.find{|poke| poke.name == player_choice}.health   
    end 

    def self.enemy_hp 
        Pokemon.all.find{|poke| poke.name == enemy_choice}.health
    end 

    def self.player_damage 
        Attack.all.find{|poke| poke.pokemon == }.damage  
    end  
    def self.enemy_damage 
        PokeAttack.all.find{|poke| poke.pokemon == player_choice}.damage 
    end  

    def self.battle
        
        while player_hp.positive? && enemy_hp.positive?
            enemy_health -= player_turn
            enemy_turn
        end 
        if player_hp.negative?
            main_menu
        elsif enemy_hp.negative?
            start
        end 
    end 




    
    
        # poke_choice = gets.chomp.downcase
        # #User include? enumerable to check if it actually exists in the api
        # if poke_choice == "pikachu" || poke_choice == "abra"
        # player = PokeApi.get(pokemon: "#{poke_choice}")
        # location
        # else puts "It's not a valid choice, please choose again"
        #     start 
        # end       
    # ## location that player prefers
    # def location 
    #     puts "Which location would you like to challege?" 
    #     puts "1. Volcano\n2. Pond"
    #     location_choice = gets.chomp.downcase 
    #     if location_choice == "1" || location_choice == "volcano" 
    #         puts "Welcome to the Vocalno world!"
    #         volcano_battle
    #     elsif location_choice == "2" || location_choice == "Pond"
    #         puts "Welcome to the Vocalno world!"
    #         pond_battle
    #     else puts "Not a valid choice"
    #         location 
    #     end 
    # end

    
    # class Cli
    #     def main_menu
    #       # Add a title? PokeFight!
    #       puts 'What would you like to do?'
    #       spacing
    #       puts " 1.) New Game\n 2.) Exit"
    #       spacing
    #       player_choice = gets.chomp.downcase
    #       if player_choice == 'new game' || player_choice == '1'
    #         start
    #       elsif player_choice == 'exit' || player_choice == '2'
    #         exit
    #       else
    #         puts 'That was an invalid choice! Please choose again.'
    #         main_menu
    #       end
    #     end
      
    #     def start
    #       spacing
    #       puts 'Which pokemon do you prefer?'
    #       spacing
    #       puts " 1.) Abra\n 2.) Pikachu"
    #       spacing
    #       poke_choice = gets.chomp.downcase
    #       # Use include? enumerable to check if it actually exists in the api
    #       if poke_choice == 'abra'
    #         player = Pokemon.all[0]
    #         location(player)
    #       elsif poke_choice =='pikachu'
    #        player = Pokemon.all[1]
    #         location(player)
    #       else
    #         puts 'Not a valid choice'
    #         start
    #       end
    #     end
      
    #     def location(player)
    #       spacing
    #       puts 'Which location would you like to challenge?'
    #       spacing
    #       puts " - Volcano\n - Pond"
    #       location_choice = gets.chomp.downcase
    #       if location_choice == 'volcano'
    #         puts 'hot!'
    #         volcano_battle(player)
    #       # elsif location_choice == 'pond'
    #       #   puts 'wet!'
    #       #   pond_battle(player)
    #       else
    #         puts 'Not a valid location! Choose again.'
    #         location(player)
    #       end
    #     end
      
    #     def volcano_battle(player)
    #       enemy = Pokemon.all.sample
    #       battle(player, enemy)
    #     end
      
    #     def battle(player, enemy)
    #       player_health = player.health
    #       enemy_health = enemy.health
    #       while player_health.positive? && enemy_health.positive?
    #         enemy_health -= player_turn(player)
    #         puts "The enemy has #{enemy_health} HP left!"
    #         if enemy_health.positive?
    #           player_health -= enemy_turn(enemy)
    #         end
    #         puts "You have #{player_health} HP left!"
    #       end
    #       if player_health.positive?
    #         location(player)
    #       else
    #         main_menu
    #       end
    #     end
      
    #     def player_turn(player)
    #       spacing
    #       puts 'What attack would you like to use?'
    #       puts player.attacks
    #       move_choice = gets.chomp.downcase
    #       PokeAtt.damage_value(move_choice)
    #     end
      
    #     def enemy_turn(enemy)
    #       spacing
    #       move_choice = enemy.enemy_attack.sample.downcase
    #       puts "The enemy used #{move_choice}!"
    #       PokeAtt.damage_value(move_choice)
    #     end
      
    #     def spacing
    #       puts ' '
    #       puts ' '
    #       puts ' '
    #       puts ' '
    #       puts ' '
    #     end
    #   end
      
end 