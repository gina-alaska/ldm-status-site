require 'sinatra/base'


class GinaLdm < Sinatra::Base
  set :ldm, Ldm.new
 
 get "/" do
    @ldm = settings.ldm
    haml :index
  end

  get "/status" do
    haml :status
  end

  run! if app_file == $0
end
