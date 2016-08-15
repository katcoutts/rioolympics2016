require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry-byebug')
require_relative('controllers/athletes_controller')
require_relative('controllers/nations_controller')
require_relative('controllers/events_controller')
require_relative('controllers/participations_controller')
require_relative('models/standing.rb')

get '/rio' do
  @standing = Standing.new()
  erb :home
end