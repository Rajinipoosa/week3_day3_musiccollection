require('pry-byebug')
require_relative('../models/albums.rb')
require_relative('../models/artists.rb')




artist1 = Artists.new({'name' => 'Rajini'})
artist1.save()
# evrthing is saved in customer object so to can call it customer.id
 album1 = Albums.new({
  'title' =>'crazy in love',
  'genre' => 'pop',
  'artist_id' => artist1.id
  })

album1.save()


binding.pry
nil