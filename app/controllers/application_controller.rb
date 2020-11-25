class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
      end

    get '/' do 
    #     <<-HTML
    #         <h1>hello</h1>
    #         <h2>how are you?</h2>

    #    HTML
       @movies = Movie.all 
       erb :movie
    end




end