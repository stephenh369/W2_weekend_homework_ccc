class SongCollection

    attr_reader :songs

    def initialize(songs)
        @songs = songs
    end

    def get_songs_by_artist(artist)
        songs_by_artist = @songs.find_all() {|song| song.artist == artist}
        songs_by_artist.map() {|song| song.song_name}
     end

end