#require 'rack/protection'
require './app/mainapp'

#use Rack::Protection, raise: true

run MainApp
