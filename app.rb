require 'sinatra'

get '/' do
  "pipabu!"
end

# See all campaigns related to the user
get '/campaigns' do
end

# submit a new campaign to generate the json,
# launch the server 
post '/campaigns' do
end

# show the new campaign page
get '/campaigns/new' do
end

# show the panel with the campaign details
get '/campaigns/:id' do
end
