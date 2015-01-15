require('rspec')
require('cd_organizer')
require('pry')

describe(Organizer) do
  before() do
    Organizer.clear()
  end


  describe('#name') do
    it('will return album name') do
      test_organizer = Organizer.new("Sublime", "40 ounces of freedom")
      expect(test_organizer.name()).to(eq("40 ounces of freedom"))
    end
  end

  describe('#artist') do
    it('will return artist') do
      test_organizer = Organizer.new("Sublime", "40 ounces of freedom")
      expect(test_organizer.artist()).to(eq("Sublime"))
    end
  end

  describe('.all') do
    it('will output array of all saved instances') do
      test_organizer = Organizer.new("Sublime", "40 ounces of freedom")
      test_organizer.save()
      expect(Organizer.all()).to(eq([test_organizer]))
    end
  end

  describe('#edit_name') do
    it('will allow change') do
      test_organizer = Organizer.new("Sublime", "40 ounces of freedom")
      test_organizer.save()
      test_organizer.edit_name("40 oz. to freedom")
      expect(test_organizer.name()).to(eq("40 oz. to freedom"))
    end
  end

  describe('#edit_artist') do
    it('will allow change') do
      test_organizer = Organizer.new("Sblime", "40 oz to freedom")
      test_organizer.save()
      test_organizer.edit_artist("Sublime")
      expect(test_organizer.artist()).to(eq("Sublime"))
    end
  end

  describe('.search') do
    it('will return an argument artist and album_name') do
    test_organizer = Organizer.new(["Sublime"], ["40 oz to freedom"])
    test_organizer.save()
    expect(Organizer.search("Sublime")).to(eq(test_organizer))
    end
  end
end
