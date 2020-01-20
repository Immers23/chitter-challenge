require 'sinatra/base'
require './lib/cheeps'

class ChitterApp < Sinatra::Base
  get '/' do
    "Cheep test"
  end

  get '/cheeps' do
  @cheeps = Cheeps.all

  erb :'cheeps/index'
end

  run! if app_file == $0
end
