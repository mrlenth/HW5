class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 R)
  end

  def self.find_in_tmdb(search_terms)

    Tmdb::Api.key("f4702b08c0ac6ea5b51425788bb26562")#initialize tmdb connection

    Tmdb::Movie.find(search_terms) #get a hash of matching movies from tmdb and return to controller

  end

  def self.create_from_tmdb(tmdb_id) #model method to add movie to database
    tmdb_movie = Tmdb::Movie.detail(tmdb_id) #get details of tmdb movie with id tmdb_id
 
    @movie = Movie.create!(:title => tmdb_movie.title, :release_date => tmdb_movie.release_date, :rating => 'G') #create a new movie with the information, and save it to the database

  end

end
