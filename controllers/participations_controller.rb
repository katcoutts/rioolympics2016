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

# create
post '/participations' do
  participation = Participation.new(params)
  participation.save()
  redirect( to("/events/#{participation.event_id}"))
end

# show
get '/participations/:id' do 
  @athletes = Athlete.all
  @events = Event.all
  @participation = Participation.find(params['id'])
  erb(:'participations/show')
end

# EDIT
get '/participations/:id/edit' do
  @events = Event.all
  @athletes = Athlete.all
  @participations = Participation.all
  @participation = Participation.find( params[:id] )
  erb( :'participations/edit' )
end

# UPDATE
post '/participations/:id' do
  Participation.update(params)
  redirect(to("/participations/#{params[:id]}"))
end

# # DESTROY
post '/participations/:id/delete' do
  Participation.destroy(params[:id])
  redirect(to('/participations'))
end




# # # SHOW


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

