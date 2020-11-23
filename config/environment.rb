# require gems 
require 'bundler/setup'
Bundler.require 

# require classes 

require_relative '../app/models/movie'

# connect to a DB
ENV['SINATRA_ENV'] ||= 'development'

ActiveRecord::Base.establish_connection(
    adapter: 'sqlite3',
    database: "db/#{ENV['SINATRA_ENV']}.sqlite"
)
