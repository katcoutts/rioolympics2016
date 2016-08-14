require_relative('../models/nation')

# INDEX
get '/nations' do
  @nations = Nation.all
  erb(:'nations/index')
end

# NEW
get '/nations/new' do
  erb(:'nations/new')
end

# CREATE
post '/nations' do
  @nation = Nation.new(params)
  @nation.save
  redirect to( "nations" )
end