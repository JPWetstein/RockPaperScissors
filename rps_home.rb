require 'sinatra'
require 'haml'
require_relative './helpers/rps_helper.rb'

set :port, 3000
include RpsHelper

get '/' do
  haml :index
end

post '/throw' do
  @throw = params[:sign]
  @computer_throw = computer_throw
  @result = shoot_result @throw, @computer_throw
  haml :throw
end