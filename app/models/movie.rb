class Movie < ActiveRecord::Base
    belongs_to :director
    belongs_to :genre

    #join table b/c it has 2 foreign keys or 2 belongs_to relationships
    
    #methods we get as a result of belongs_to:
    # .director 
    # .director=(accept a director obj as an arugment) 
    # .build_director(accept a director attributes hash)
    # .create_director(accept a director attributes hash)
end