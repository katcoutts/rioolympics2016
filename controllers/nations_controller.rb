require_relative('../models/nation')

# INDEX
get '/nations' do
  @nations = Nation.all.sort_by { |k| k.name}
  erb(:'nations/index')
end

# NEW
get '/nations/new' do
  erb(:'nations/new')
end

# CREATE
post '/nations' do
  @nation = Nation.new(params)
  @nation.save()
  erb(:'nations/create' )
end

# SHOW
get '/nations/:id' do 
  @nation = Nation.find(params['id'])
  erb(:'nations/show')
end

# EDIT
get '/nations/:id/edit' do
  @nation = Nation.find( params[:id] )
  erb( :'nations/edit' )
end

# UPDATE
post '/nations/:id' do
  Nation.update(params)
  redirect(to("/nations/#{params[:id]}"))
end

# DESTROY
post '/nations/:id/delete' do
  Nation.destroy(params[:id])
  redirect(to('/nations'))
end