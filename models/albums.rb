require('pg')
require_relative('../db/sql_runner')

class Albums
   attr_accessor :title, :genre
    attr_reader  :id , :artist_id
  def initialize( options )

    @title =  options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql = "INSERT INTO albums(title,genre,artist_id) VALUES('#{@title}',
    '#{@genre}',
    '#{@artist_id}') RETURNING id;"
    
    result = SqlRunner.run(sql)
     @id = result[0]["id"].to_i
  end
  def self.all()
    
    sql = "SELECT * FROM albums"
      results = SqlRunner.run(sql)
      albums = results.map{|result| Albums.new(result) }
      return albums

   
  end

end