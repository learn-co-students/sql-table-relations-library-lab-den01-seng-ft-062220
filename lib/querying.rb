def select_books_titles_and_years_in_first_series_order_by_year
  'SELECT books.title, books.year
  FROM books
  JOIN series
  ON books.series_id = series.id
  WHERE series.id = (SELECT MIN(series.id) FROM series);'
end

def select_name_and_motto_of_char_with_longest_motto
  'SELECT name, motto
  FROM characters
  WHERE LENGTH(motto) = (SELECT MAX(LENGTH(motto)) FROM characters);'
end

def select_value_and_count_of_most_prolific_species
  'SELECT species, COUNT(species)
  FROM characters
  GROUP BY species
  ORDER BY COUNT(species) DESC LIMIT 1;'
end

def select_name_and_series_subgenres_of_authors
  'SELECT authors.name, subgenres.name
  FROM authors
  JOIN (subgenres JOIN series ON subgenres.id = series.subgenre_id)
  ON authors.id = series.author_id;'
end

def select_series_title_with_most_human_characters
  "SELECT series.title
  FROM series
  JOIN (characters JOIN authors ON authors.id = characters.author_id)
  ON series.author_id = authors.id
  WHERE characters.species = 'human'
  GROUP BY series.title
  ORDER BY COUNT(characters.species) DESC LIMIT 1;"
end

def select_character_names_and_number_of_books_they_are_in
  'SELECT characters.name, COUNT(character_books.book_id) AS books
  FROM characters
  JOIN character_books
  ON character_books.character_id = characters.id
  GROUP BY characters.name
  ORDER BY books DESC, characters.name;'
end
