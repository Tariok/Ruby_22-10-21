require_relative 'view'
require_relative 'gossip'

class Controller
  attr_accessor :view

  def initialize
    @view = View.new
  end

  def create_gossip
    params = @view.create_gossip
    #pour le moment, le contenu de ce gossip est inscrit "en dur" dans le code. L'utilisateur ne peut pas le changer.
    gossip = Gossip.new(params)
    gossip.save
  end 

  def index_gossips
    # demande au model de lui sortir tous les potins, puis les donner à la view pour qu'elle puisse les afficher
    all_gossips_array = Gossip.all
    puts "Tous les potins :"
    puts all_gossips_array
    @view.index_gossips(all_gossips_array)
  end

end