# Pokemon class
class Pokemon < ActiveRecord::Base 
    has_many :pokeattacks 
    has_many :attacks, through: :pokeattacks

    def self.pokemon_names
        response = RestClient.get("https://pokeapi.co/api/v2/pokemon") 
        parsed_response = JSON.parse(response)
        parsed_response["results"].map{|result| result["name"]}
    end 
    
    def self.create_pokemons
        i = 0
        while i < pokemon_names.length
        create(:name => pokemon_names[i], :health => rand(100..120))
        i += 1
        end 
    end
end 