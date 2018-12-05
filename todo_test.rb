ENV['RACK_ENV'] = 'test'

require_relative 'todo_app'
require 'test/unit'
require 'rack/test'

class TodoTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
	end

	def test_it_says_hello_world
    get '/'
    assert last_response.ok?
    assert_equal 'Hello World!', last_response.body
  end


end



