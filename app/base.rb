module Tutspolls
  class App < Sinatra::Base
    set :public_folder, File.expand_path("../../public", __FILE__)

    get "/" do
      haml :index
    end
  end
end
