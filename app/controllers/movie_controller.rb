class MovieController < ApplicationController

    #get all movies - READ
    get '/movies' do 
        # display the index view 
        @movies = Movie.all # accessed the model 
        erb :"movies/index" 
    end

    # view the form to CREATE a movie 
    get '/movies/new' do 
        # display the new view 
        erb :"movies/new"
    end

    # get 1 movie - READ
    get '/movies/:id' do
        @movie = Movie.find(params["id"])
        erb :"movies/show"
        # display the show view 
    end

    # CREATE a new movie 
    post '/movies' do 
        movie = Movie.new(params)
        # Movie.new(title: params["title"])
        movie.save 
        redirect '/movies' # makes a new GET request 
    end

    # view the form to UPDATE 1 particular movie
    get '/movies/:id/edit' do
        @movie = Movie.find(params["id"])
        erb :"movies/edit"
    end

    # UPDATE 1 movie based on the edit form 
    put '/movies/:id' do
        @movie = Movie.find(params["id"]) 
        # @movie.update(title: params["movie"]["title"])
        @movie.update(params["movie"])
        redirect "/movies/#{@movie.id}"
    end

    delete '/movies/:id' do 
        @movie = Movie.find(params["id"])
        @movie.destroy
        redirect '/movies'
    end

end