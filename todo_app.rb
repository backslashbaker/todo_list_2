require 'sinatra'
require 'sinatra/reloader'

TODO = []

def create_list_item(todo)
	todos = {todo: todo, status: false}
	TODO << todos
end

get '/' do
	erb :welcome
end

get '/new_item' do
	erb :new_item
end

post '/new_item' do
	new_item = create_list_item(params[:todo])
	redirect '/'
end

