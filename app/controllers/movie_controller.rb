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
        if !logged_in? 
            redirect '/login'  #leave the method 
        end
        erb :"movies/new"
    end

    # get 1 movie - READ
    get '/movies/:id' do
        redirect_if_not_logged_in
        @movie = Movie.find(params["id"])
        erb :"movies/show"
        # display the show view 
    end

    # CREATE a new movie 
    post '/movies' do 
        redirect_if_not_logged_in
        movie = current_user.movies.build(params)
        # movie = Movie.new(params)
        # movie.user = current_user
        # movie.user_id = session[:user_id]
        # current_user.movies << movie 
        movie.save 
        redirect '/movies' # makes a new GET request 
    end

    # view the form to UPDATE 1 particular movie
    get '/movies/:id/edit' do
        @movie = Movie.find(params["id"])
        redirect_if_not_authorized
        erb :"movies/edit"
    end

    # UPDATE 1 movie based on the edit form 
    put '/movies/:id' do
        @movie = Movie.find(params["id"]) 
        redirect_if_not_authorized
        # @movie.update(title: params["movie"]["title"])
        @movie.update(params["movie"])
        redirect "/movies/#{@movie.id}"
    end

    delete '/movies/:id' do 
        @movie = Movie.find(params["id"])
        redirect_if_not_authorized
        @movie.destroy
        redirect '/movies'
    end

    private 
    def redirect_if_not_authorized
        if @movie.user != current_user
            redirect '/movies'
        end
    end

end