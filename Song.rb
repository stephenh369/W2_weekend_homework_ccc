class Song

    attr_reader :artist, :song_name, :genre

    def initialize(artist, song_name, genre)
        @artist = artist
        @song_name = song_name
        @genre = genre

    end


end