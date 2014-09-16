require 'sinatra'
require 'slim'

get '/' do
  "pipabu!"
end

get '/campaigns' do
  slim :campaigns
end

get '/campaigns/new' do

end

get '/campaigns/:id' do

end
