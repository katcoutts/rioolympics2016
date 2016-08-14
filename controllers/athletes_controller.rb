require_relative('../models/athlete')
require_relative('../models/nation.rb')

# index
get '/athletes' do
  @athletes = Athlete.all
  erb(:'athletes/index')
end

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

# SHOW
get '/athletes/:id' do 
  @athlete = Athlete.find(params['id'])
  erb(:'athletes/show')
end

# EDIT
get '/athletes/:id/edit' do
  @athlete = Athlete.find( params[:id] )
  @nations = Nation.all()
  erb( :'athletes/edit' )
end

# # UPDATE
post '/athletes/:id' do
  Athlete.update(params)
  redirect(to("/athletes/#{params[:id]}"))
end

# DESTROY
post '/athletes/:id/delete' do
  Athlete.destroy(params[:id])
  redirect(to('/athletes'))
end