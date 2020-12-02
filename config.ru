require_relative './config/environment'

use Rack::MethodOverride 

use MovieController
run ApplicationController