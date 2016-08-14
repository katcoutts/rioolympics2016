require 'pry-byebug'
require_relative('../models/participation.rb')
require_relative('../models/athlete.rb')
require_relative('../models/event.rb')


# index
get '/participations' do
  @participations = Participation.all
  erb(:'participations/index')
end

#new
get '/participations/new' do
  @events = Event.all()
  @athletes = Athlete.all()
  erb(:'participations/new')
end


post '/participations' do
  participation = Participation.new(params)
  participation.save()
  redirect( to('/participations'))
end

# # # new
# get '/events/new' do
#   @events = Event.all()
#   erb(:'events/new')
# end

# # # create
# post '/events' do
#   @events = Event.all
#   @event = Event.new(params)
#   @event.save
#   redirect to( "events" )
# end

# # # SHOW
# get '/events/:id' do 
#   @athletes = Athlete.all
#   @event = Event.find(params['id'])
#   erb(:'events/show')
# end

# # # EDIT
# get '/events/:id/edit' do
#   @events = Event.all
#   @event = Event.find( params[:id] )
#   erb( :'events/edit' )
# end

# # # # UPDATE
# post '/events/:id' do
#   Event.update(params)
#   redirect(to("/events/#{params[:id]}"))
# end

# # # DESTROY
# post '/events/:id/delete' do
#   Event.destroy(params[:id])
#   redirect(to('/events'))
# end

