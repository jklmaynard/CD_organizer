class Organizer
  @@all_cds = []

  define_method(:initialize) do |artist, album_name|
    @artist = artist
    @album_name= album_name
# binding.pry
  end

  define_method(:name) do
    @album_name
  end

  define_method(:artist) do
    @artist
  end

  define_singleton_method(:all) do
    @@all_cds
  end

  define_method(:save) do
    @id = @@all_cds.length.+(1)
    @@all_cds.push(self)
  end

  define_method(:id) do
    @id
  end

  define_method(:edit_id) do
    @id = new_id
  end

  define_method(:edit_name) do |replace|
    @album_name = replace
  end

  define_method(:edit_artist) do |new_artist|
    @artist = new_artist
  end

  define_singleton_method(:clear) do
    @@all_cds = []
  end

  define_singleton_method(:search) do |query|
    output= nil
    @@all_cds.each() do |cd|
      cd.artist().each do |artist|
        if artist == query
          output = cd
        end
      end
    end
    output
  end
end
