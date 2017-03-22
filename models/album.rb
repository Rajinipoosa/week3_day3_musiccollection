require('pg')
require_relative('../db/sql_runner')

class Album
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
    #{@artist_id}) RETURNING id;"
    
    result = SqlRunner.run(sql)
     @id = result[0]["id"].to_i
  end

  def update()
    
   sql = "UPDATE albums SET(
   title,
   genre,
   artist_id) = (
   '#{@title}',
   '#{@genre}',
    #{@artist_id}) WHERE id = #{@id}"
    
    
      result = SqlRunner.run(sql)


  end
  def self.all()
    
    sql = "SELECT * FROM albums"
      results = SqlRunner.run(sql)
      albums = results.map{|result| Album.new(result) }
      return albums

   
  end
  def self.delete_all()
    
    sql = "DELETE FROM albums"
    result = SqlRunner.run(sql)
    

  end
 
  def artist()

    sql = "SELECT * FROM artists where id = #{@artist_id}"
      result = SqlRunner.run(sql)
       order = Artist.new(result.first)
       # puts {@artist_id}
         # create array of orders then return them  
        # artist_album = results[0]
        # result = Albums.new(artist_album)
        return order
      end
end