require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
require('pg')
require('pry')
also_reload './lib/**/*.rb'

DB = PG.connect({:dbname => 'hair_salon'})

get('/') do
  erb(:index)
end

get("/stylists") do
  erb(:stylist_form)
end

post ('/stylists') do
  name = params.fetch("name")
  stylist = Stylist.new({:name => name, :stylist_id => nil})
  stylist.save()
  erb(:stylist)
end
