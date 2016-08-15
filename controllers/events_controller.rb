require_relative('../models/event')
require_relative('../models/participation')
require_relative('../models/athlete')


# EVENTS CAN'T BE PROPERLY EDITED OR ADDED YET WITHOUT LETTING PEOPLE GIVE GOLD-ID, SILVER-ID AND BRONZE-ID BUT WE CAN'T DO THIS UNTIL PARTICIPATIONS IS SET UP AS USING THAT WE'LL BE ABLE TO DO A DROP DOWN OF ALL ATHLETES TAKING PART TO SELECT FROM.


# index
get '/events' do
  @events = Event.all
  erb(:'events/index')
end

# # new
get '/events/new' do
  @events = Event.all()
  @athletes = Athlete.all()
  erb(:'events/new')
end

# # create
post '/events' do
  @events = Event.all
  @event = Event.new(params)
  @event.save
  redirect to( "events" )
end

# # SHOW
get '/events/:id' do 
  @athletes = Athlete.all
  @participations = Participation.all
  @event = Event.find(params['id'])
  erb(:'events/show')
end

# # EDIT
get '/events/:id/edit' do
  @events = Event.all
  @event = Event.find( params[:id] )
  erb( :'events/edit' )
end

# # # UPDATE
post '/events/:id' do
  Event.update(params)
  redirect(to("/events/#{params[:id]}"))
end

# # DESTROY
post '/events/:id/delete' do
  Event.destroy(params[:id])
  redirect(to('/events'))
end

