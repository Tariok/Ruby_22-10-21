
class View
 attr_accessor :content , :author
 
  def create_gossip
    puts "Donne ton blaz' :"
    author = gets.chomp
    puts "Quel ragot aujourd'hui? :"
    content = gets.chomp
   
    return params = {content: content , author: author}
  end

  def print_gossip(gossip)
    puts "_____________________________"
    puts "Blaz: #{gossip.author}"
    puts "Content: #{gossip.content}"
  end

  def index_gossips(all_gossips_array)
    all_gossips_array.each do |thisGossip|
      print_gossip(thisGossip)
    end
  end

end