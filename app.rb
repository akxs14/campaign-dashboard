require 'rubygems'
require 'sinatra'
require 'slim'
require 'bcrypt'
require_relative 'models'
require_relative 'timedate'

enable :sessions

helpers do
  def login?
    session[:username].nil? ? false : true 
  end

  def username
    session[:username]
  end
end

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
  @campaigns = DB[:campaigns].all
  @day_secs = 60 * 60 * 24
  slim :campaigns_list
end


# submit a new campaign to generate the json,
# launch the server 
post '/campaigns' do
  # dimiourgise kainourgia kampania
end

# show the new campaign page
get '/campaigns/new' do
  @campaign_types = DB[:campaign_types].all  
  @creative_templates = DB[:creative_templates].all
  slim :campaigns_new
end

# show the panel with the campaign details
get '/campaigns/:id' do
  # fortose stoixeia kampanias
end

post "/login" do
  
end



