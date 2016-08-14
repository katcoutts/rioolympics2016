require_relative('../models/athlete')
require_relative('../models/nation.rb')


get '/athletes/new' do
  @nations = Nation.all()
  erb(:'athletes/new')
end

post '/athletes' do
  @athlete = athlete.new(params)
  @athlete.save
  redirect to( "athletes" )
end