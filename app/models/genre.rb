class Genre < ActiveRecord::Base
    #self.has_many(:movies)
    has_many :movies
    has_many :directors, through: :movies

    # is giving us the following instance methods: 
    # .movies
    # .movies << (movie_object)
    # .movie_ids
    # .movie_ids=(array_of_ids)
    # .movies.build(pass in movie attributes)
end