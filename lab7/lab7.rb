#!/usr/bin/env ruby

require 'csv'
  
films = CSV.read('Film.csv', 'r:ISO-8859-1', { headers: true, return_headers: true })
movies = CSV.read('Movies.csv', 'r:ISO-8859-1', { headers: true, return_headers: true })


films.delete('Subject')
films.delete('Actor')
films.delete('Actress')
films.delete('Popularity')
films.delete('Awards')
films.delete('*Image')

movies.delete('votes')
movies.delete('r1')
movies.delete('r2')
movies.delete('r3')
movies.delete('r4')
movies.delete('r5')
movies.delete('r6')
movies.delete('r7')
movies.delete('r8')
movies.delete('r9')
movies.delete('r10')
movies.delete('mpaa')
movies.delete('id')

CSV.open('FilmMovies.csv', 'w') do |csv|
  films.each do |film|
    movies.each do |movie|
      if film[0] == movie[1] && film[1] == movie[2] && film[2] == movie[0]
        input = Array.new
        film.each do |item|
          input.push(item)
        end
        movie.delete(film[0])
        movie.delete(film[1])
        movie.delete(film[2])
        movie.each do |item|
          input.push(item)
        end
        csv << input
      end
    end
  end
end



