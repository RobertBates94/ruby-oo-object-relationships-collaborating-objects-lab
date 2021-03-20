class Song
    attr_accessor :name
    attr_reader :artist
    
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def artist=(artist)
        @artist = artist
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end

    def self.new_by_filename(file_name)
        file_array = file_name.split(/\-|\./)
        new_instance = Song.new(file_array[1].strip)
        new_instance.artist = (Artist.new(file_array[0].strip))
        new_instance
    end
    
end