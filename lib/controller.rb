# require 'bundler'
# Bundler.require
require 'gossip'

class ApplicationController < Sinatra::Base
  # Grâce à l'héritage, ApplicationController aura toutes les fonctionnalités que propose la classe Sinatra::Base
  
  #dirige vers mon accueil
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  #diriger vers ma page pour créer un potin 
  get '/gossips/new/' do 
    erb :new_gossip
  end

  # récupère les données de mon formulaire et rediriger vers l'accueil une fois que les infos ont été submit
  post '/gossips/new/' do
    # puts "Salut, je suis dans le serveur"
    # puts "Ceci est le contenu du hash params : #{params}"
    # puts "Trop bien ! Et ceci est ce que l'utilisateur a passé dans le champ gossip_author : #{params["gossip_author"]}"
    # puts "De la bombe, et du coup ça, ça doit être ce que l'utilisateur a passé dans le champ gossip_content : #{params["gossip_content"]}"
    # puts "Ça déchire sa mémé, bon allez je m'en vais du serveur, ciao les BGs !"
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    # Gossip.new("super_auteur", "super gossip").save => permet de tester
    redirect '/' #permet de redirgier le user vers la page d'accueil
  end

  get '/gossips/:id' do 
    puts "Vous avez choi le potin numéro #{params['id']}"
    puts "#{Gossip.find(params['id'].to_i)}"
    erb :show, locals: {gossip: Gossip.find(params['id'].to_i)}
  end

  # run! if app_file == $0
end