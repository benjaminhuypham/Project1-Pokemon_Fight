class PokeAttack < ActiveRecord::Base 
    belongs_to :pokemon
    belongs_to :attack

   def self.create_pokeattack
        i = 0
        while i < Pokemon.all.length
        create(:pokemon => Pokemon.all[i], :attack => Attack.all[i])
        i += 1
        end
    end  
    
end  
