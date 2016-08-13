require_relative('../models/nation')

get '/nations/new' do
  erb(:'nations/new')
end

post '/nations' do
  @nation = Nation.new(params)
  @nation.save
  redirect to( "nations" )
end