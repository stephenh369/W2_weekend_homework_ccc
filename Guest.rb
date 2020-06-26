class Guest
    
    attr_reader :name, :cash, :fav_song, :fav_genre

    def initialize(name, cash, fav_song, fav_genre)
        @name = name
        @cash = cash
        @fav_song = fav_song
        @fav_genre = fav_genre

    end

end