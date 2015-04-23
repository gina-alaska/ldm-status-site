require 'sinatra/base'

class GinaLdm < Sinatra::Base
  set :ldm, Ldm.new
  set :server, :puma 
 
  get "/" do
    @ldm = settings.ldm
    haml :index
  end

  get "/status" do
    haml :status
  end

  get "/queue/:queue" do
    @name = params[:queue].to_s
    @queue = settings.ldm.queues[@name]
    haml :queue
  end

  run! if app_file == $0
end
