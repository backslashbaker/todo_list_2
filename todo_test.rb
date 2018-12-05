ENV['RACK_ENV'] = 'test'

require_relative 'todo_app'
require 'test/unit'
require 'rack/test'

class TodoTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
	end

	def test_it_shows_welcome_page
    get '/'
    assert last_response.ok?
    assert last_response.body.include? ('Welcome to the Todo list app')
	end

	def test_it_creates_new_item
		post '/new_item', :todo => 'foo'
		get '/'
		assert last_response.ok?
		assert last_response.body.include? ('foo')
	end

	def test_it_edits_item
		post '/edit_item', :index => 1, :todo => 'bar'
		get '/'
		assert last_response.body.include? ('bar')
	end

	def test_it_marks_as_completed
		post '/complete_item', :index => 1, :todo => 'bar', :complete => true
		get '/'
		assert last_response.body.include? (true)
	end




end




