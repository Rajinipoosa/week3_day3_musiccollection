require('pry-byebug')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')

Album.delete_all()
Artist.delete_all()



artist1 = Artist.new({'name' => 'Rajini'})
artist1.save()
# evrthing is saved in customer object so to can call it customer.id
 album1 = Album.new({
  'title' =>'crazy in love',
  'genre' => 'pop',
  'artist_id' => artist1.id
  })


 album2 = Album.new({
  'title' =>'lala land',
  'genre' => 'pop',
  'artist_id' => artist1.id
  })

album1.save()
album2.save()

binding.pry
nil