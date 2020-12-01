class MovieController < ApplicationController

    #get all movies 
    get '/movies' do 
        # display the index view 
        @movies = Movie.all # accessed the model 
        erb :"movies/index" 
    end

    # view the form to create a movie 
    get '/movies/new' do 
        # display the new view 
        erb :"movies/new"
    end

    # get 1 movie
    get '/movies/:id' do
        @movie = Movie.find(params["id"])
        erb :"movies/show"
        # display the show view 
    end

    

    # create a new movie 
    post '/movies' do 
        movie = Movie.new(params)
        # Movie.new(title: params["title"])
        movie.save 
        redirect '/movies'
    end

    # view the form to edit 1 particular movie
    get '/movies/:id/edit' do
        @movie = Movie.find(params["id"])
        # display the edit view
    end

    # UPDATE 1 movie based on the edit form 
    put '/movies/:id' do
        @movie = Movie.find(params["id"]) 
    end

    # DELETE 1 movie 
    delete '/movies/:id' do 
        @movie = Movie.find(params["id"])
    end

end