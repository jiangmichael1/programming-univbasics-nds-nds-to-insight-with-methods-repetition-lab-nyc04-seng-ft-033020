$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  list = []
  d_index = 0

  while d_index < source.length do
    list << source[d_index][:name]
    d_index += 1
  end
  list
end

def total_gross(source)
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
  dir_and_earnings = directors_totals(source)
  dir_names_list = list_of_directors(source)
  total = 0
  d_index = 0

  while d_index < source.length do
    dir_name = dir_names_list[d_index]
    total += dir_and_earnings[dir_name]
    d_index += 1
  end 
  total
end
