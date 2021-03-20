require 'pry'

class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path

    end
    
    def files
        @path2 = @path + "/**/*"
        @path3 = Dir[@path2].map{|f| File.basename(f)}
    end

    def import
        list = self.files
        list.each do |filename|
            Song.new_by_filename(filename)
        end
    end

end