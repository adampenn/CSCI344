#!/usr/bin/env ruby

require 'csv'

t1 = Time.now

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

i = 0
CSV.open('FilmMovies.csv', 'w') do |csv|
header = false
  films.each do |film|
    movies.each do |movie|
      if film[0] == movie[1] && film[1] == movie[2] && film[2] == movie[0]
        if !header
          put_header = Array.new
        end
        output = Array.new
        film.each do |item|
          if !header
            put_header.push(item[0])
          end
          output.push(item[1])
        end
        movie.delete(film[0])
        movie.delete(film[1])
        movie.delete(film[2])
        movie.each do |item|
          if !header
            put_header.push(item[0])
          end
          output.push(item[1])
        end
        if !header
          csv << put_header
          header = true
        end
        csv << output
        i = i+1
        puts "Still working... #{i}"
      end
    end
  end
end

t2 = Time.now
puts (t2 - t1)
