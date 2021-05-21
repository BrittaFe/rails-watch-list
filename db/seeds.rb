require 'open-uri'
require 'json'

url = 'http://tmdb.lewagon.com/movie/top_rated'

file = URI.open(url).read

movies = JSON.parse(file)

movies['results'].each do |movie|
  title = movie['title']
  overview = movie['overview']
  poster_url = "https://image.tmdb.org/t/p/original/#{movie['poster_path']}"
  rating = movie['vote_average']
  Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
end
