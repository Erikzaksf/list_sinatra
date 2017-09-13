require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/list')
require('pry')


get('/') do
  @list = Item.all()
  erb(:output)
end

post('/') do
  name = params["name"]
  rank = params["rank"].to_i
  item = Item.new(name, rank)
  @list = Item.all()

  item.save()
  erb(:output)
end

get('/items/:id') do
  @item = Item.find(params[:id])
  erb(:item)
end
