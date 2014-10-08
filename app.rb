require 'sinatra'
require 'slim'

configure do
  set :public_folder, 'public'
end

get '/' do
  slim :index
end

get '/login' do
  slim :login
end

# See all campaigns related to the user
get '/campaigns' do
  slim :campaigns_list
end


# submit a new campaign to generate the json,
# launch the server 
post '/campaigns' do

end

# show the new campaign page
get '/campaigns/new' do
  slim :campaigns_new
end

# show the panel with the campaign details
get '/campaigns/:id' do
end
