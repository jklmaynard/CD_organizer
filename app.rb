require('sinatra')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require("./lib/cd_organizer")
require('pry')

  get('/') do
    @albums = Organizer.all()
    erb(:form)
  end

  post('/albums') do
    @album_name = params.fetch("album_name")
    @artist = params.fetch("artist")
    album = Organizer.new(@artist, @album_name)
    album.save()
    @albums = Organizer.all()
    erb(:form)
  end
