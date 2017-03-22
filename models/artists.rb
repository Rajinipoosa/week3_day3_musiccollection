require('pg')
require_relative('../db/sql_runner')


class Artists
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
    artists = results.map{|result| Artists.new(result) }
    return artists

  end
 
end