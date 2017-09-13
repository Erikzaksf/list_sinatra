require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/list')

get('/') do
  @list = Item.all()
  erb(:output)
end

post('/') do
  name = params["name"]
  item = Item.new(name)
  item.save()
  @list = Item.all()
  erb(:output)
end

get('/items/:id') do
  @item = Item.find(params[:id])
  erb(:item)
end
