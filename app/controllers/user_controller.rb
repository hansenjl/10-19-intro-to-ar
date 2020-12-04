class UserController < ApplicationController

    # users to be able to signup 
    get '/signup' do
        erb :"users/new"
    end

    post "/signup" do 
        #handle signing up the user 
       # params.values.all?{|value| !value.blank? }
        # instantiate a user 
        u = User.new(email: params["email"], password: params["password"])
        # make sure the user signed up with "valid" data 
        if u.email.blank? || u.password.blank? || User.find_by_email(params["email"])
           # invalid login attempt 
           redirect '/signup'
        else
            #valid attempt 
            u.save 
            session[:user_id] = u.id# "log them in"
            redirect '/movies' # redirect them elsewhere 
        end
        
    end

    get '/login' do #show the form
        erb :"/users/login"
    end

    post '/login' do  #process the form 
        user = User.find_by_email(params[:email])
        # check and see if there is a user w/ that email address
        # is there password correct
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect '/movies'
        else
            redirect '/login'
        end
    end

    get '/logout' do 
        session.delete(:user_id)  # delete just the user_id 
        # session.clear 
        redirect '/signup'
    end
end