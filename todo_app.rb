require 'sinatra'
require 'sinatra/reloader'

TODO = []

def create_list_item(todo)
	todos = {todo: todo, status: false}
	TODO << todos
end

def edit_list_item(todo, index)
	TODO[index.to_i - 1][:todo] = todo
end

get '/' do
	erb :welcome
end

get '/new_item' do
	erb :new_item
end

get '/edit_item' do
	erb :edit_item
end

post '/new_item' do
	new_item = create_list_item(params[:todo])
	redirect '/'
end

post '/edit_item' do
	edit_list_item(params[:todo], params[:index])
	redirect '/'
end







