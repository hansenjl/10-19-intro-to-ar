class User < ActiveRecord::Base
    has_many :movies 
    has_secure_password #from ActiveRecord
    # provides a reader/writer method for password 
    # provides a .authenticate method 
    # def password=(plain_password)
    #     @password = plain_password 
    #     # add "salt" to the plain passowrd 
    #     # send the plain password + salt through bcrypt to become hashed 
    #     # set @password_digest = the hashed(encrypted password)
    # end

    # email
    # password_digest 
end