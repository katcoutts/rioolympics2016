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

# # EDIT
# get '/nations/:id/edit' do
#   @nation = Nation.find( params[:id] )
#   erb( :'nations/edit' )
# end

# # UPDATE
# post '/nations/:id' do
#   Nation.update(params)
#   redirect(to("/nations/#{params[:id]}"))
# end

# # DESTROY
# post '/nations/:id/delete' do
#   Nation.destroy(params[:id])
#   redirect(to('/nations'))
# end