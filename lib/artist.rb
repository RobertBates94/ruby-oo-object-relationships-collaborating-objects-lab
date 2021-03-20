require 'pry'

class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end
    

    def self.all
        @@all
    end
    

    def add_song(song)
        song.artist = self
    end
    

    def add_song_by_name(name)
        song = Song.new(name)
        song.artist = self
    end
    
      def songs
        Song.all.select {|song| song.artist == self}
      end
    

    def self.song_count
        Song.all.count
    end

    def self.find_or_create_by_name(name)
        self.all.detect {|artist| artist.name == name} || Artist.new(name)
    end

    def print_songs
        songs.each {|song| puts song.name}
    end

end