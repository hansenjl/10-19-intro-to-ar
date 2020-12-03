require_relative './config/environment'

use Rack::MethodOverride 

use MovieController
use UserController 
run ApplicationController