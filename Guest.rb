class Guest
    
    attr_reader :name, :cash, :fav_song, :fav_genre

    def initialize(name, cash, fav_song, fav_genre)
        @name = name
        @cash = cash
        @fav_song = fav_song
        @fav_genre = fav_genre
    end

    def change_total_cash(amount)
        @cash += amount
    end

    def change_fav_song(song_name)
        @fav_song = song_name
    end

    def change_fav_genre(genre)
        @fav_genre = genre
    end
end