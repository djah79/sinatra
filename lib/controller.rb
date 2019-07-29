require 'bundler'
Bundler.require

require 'gossip'

class ApplicationController < Sinatra::Base
=begin
	get '/' do
  		erb :index
	end
	end
=end
	get '/' do
  	erb :index, locals: {gossips: Gossip.all}
	end
	get '/gossips/:id' do
	  erb :show, locals: {pition: Gossip.find(params["id"].to_i)}
	end

	get '/gossips/new/' do
  	erb :new_gossip
	end
	get '/gossips/:id/edit' do
	  erb :edit
	end
	post '/gossips/:id/edit' do
  	Gossip.edit(params["id"].to_i,params["gossip_author_edit"],params["gossip_content_edit"])
  	redirect '/'
	end
	post '/gossips/new/' do
  	Gossip.new(params["gossip_author"], params["gossip_content"]).save
  	redirect '/'
	end
=begin
	get '/gossips/:id' do
	  erb :show, locals: {pition: Gossip.find(pamars["id"])}
	end
	post '/gossips/new/' do
	  puts "Salut, je suis dans le serveur"
	  puts "Ceci est le contenu du hash params : #{params}"
	  puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
	  puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
	  puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
	end
=end
end