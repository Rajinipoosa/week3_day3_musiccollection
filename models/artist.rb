require('pg')
require_relative('../db/sql_runner')


class Artist
attr_accessor :name
attr_reader  :id 
def initialize( options )

  @name = options['name']
  @id = options['id'].to_i if options['id']

end
  def save()
    sql = "INSERT INTO artists(name) VALUES ('#{@name}')  RETURNING id;"
    result = SqlRunner.run(sql)

    @id = result[0]["id"].to_i

  end
  def self.all()
    sql = "SELECT * FROM artists"
    results = SqlRunner.run(sql)
    artists = results.map{|result| Artist.new(result) }
    return artists

  end
  def self.delete_all()

    sql = "DELETE FROM artists"
    result = SqlRunner.run(sql)


  end
  def update()

    sql = "UPDATE artists SET (name) = ('#{@name}') WHERE id = #{@id}"
    results = SqlRunner.run(sql)


  end

  def albums()

    sql = "SELECT * FROM albums where artist_id = #{@id}"
    result = SqlRunner.run(sql)
       # order = results.map {|artist| Album.new(artist)}

       return result.map {|album_hash| Album.new(album_hash) }

     end
  def delete()
      sql = "DELETE FROM artists where id = #{@id}"

      result = SqlRunner.run(sql)

    end
  def self.find(id)

    sql = "SELECT * FROM artists WHERE id = #{id}"
    result = SqlRunner.run(sql)

    return result.first 
  end
  end