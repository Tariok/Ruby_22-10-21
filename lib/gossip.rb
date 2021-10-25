require_relative 'controller'
require_relative 'view'
require 'csv'

class Gossip
attr_accessor :author, :content

  def initialize(params)
     @author = params[:author]
     @content = params[:content]

  end


  def save  
    CSV.open("./db/data_base.csv", "a") do |csv|
      csv << [@author, @content]
    end
     
  end

  def self.all
    # lit chaque ligne du CSV, puis retourner un array contenant des instances de potins du genre : [potin_1, potin_2, …, potin_n].
    kept_datas = CSV.read("./db/data_base.csv")
    puts kept_datas.class
    all_gossips_array = []
    kept_datas.each do |ligne|
      gossip_provisoire = Gossip.new({ content: ligne[1], author: ligne[0] })
      all_gossips_array << gossip_provisoire
    end
    return all_gossips_array
  end

end