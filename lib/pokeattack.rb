class PokeAttack < ActiveRecord::Base 
    belongs_to :pokemon
    belongs_to :attack

   def self.create_pokeattack
    create(:pokemon => Pokemon.create_pokemons, :attack => Attack.create_attacks)
   end 
    
end  
