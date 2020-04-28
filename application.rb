require 'sinatra'

class Application < Sinatra::Base
  get '/oauth/token' do
    'The access token should be here.'
  end
end