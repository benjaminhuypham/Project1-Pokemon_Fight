require 'sinatra/activerecord'
require 'require_all'
require 'pry'
require 'poke-api-v2'
require 'rest-client'

require_all 'lib'

ActiveRecord::Base.establish_connection(
    adapter: "sqlite3", 
    database: "db/pokemon.db"
)
ActiveRecord::Base.logger = nil

# binding.pry
Cli.main_menu




