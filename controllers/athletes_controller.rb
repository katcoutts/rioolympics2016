require_relative('../models/athlete')
require_relative('../models/nation.rb')

# new
get '/athletes/new' do
  @nations = Nation.all()
  erb(:'athletes/new')
end

# create
post '/athletes' do
  @athlete = Athlete.new(params)
  @athlete.save
  redirect to( "athletes" )
end

# index
get '/athletes' do
  @athletes = Athlete.all
  erb(:'athletes/index')
end