class Link < ActiveRecord::Base
  validates :in_url, :http_status, :presence => true
  validates :out_url, :uniqueness => true
  
  after_save generate_short_url(self.id)
  
  def generate_short_url(id)
    characters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", '0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
    num_options = characters.size
    remainders = []
    dividend = id
    
    until dividend < num_options do
      remainders << dividend % num_options
      dividend /= num_options
    end
    
    final_values = remainders << dividend
    
    shortened_url = ''
    final_values.reverse.each { |v| shortened_url << characters[v] }
    
    shortened_url
  end
end
