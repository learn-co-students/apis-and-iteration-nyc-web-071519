require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  response_hash["results"].find {|character| character["name"].downcase == character_name}["films"].map {|url| JSON.parse(RestClient.get(url))}
  
  # character_info = response_hash["results"].find do |character|
  #   character["name"].downcase == character_name
  # end
  
  # movie_info_array = character_info["films"].map do |url| 
  #   JSON.parse(RestClient.get(url))
  # end
end

def print_movies(films)
  films.each do |film|
    puts film["title"]
    puts "---------"
    puts film["opening_crawl"]
    puts "---------"
    puts "---------"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
