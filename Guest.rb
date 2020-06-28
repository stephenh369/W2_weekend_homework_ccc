class Guest
    
    attr_reader :name, :cash, :fav_song, :fav_genre, :tab

    def initialize(name, cash, fav_song, fav_genre, tab)
        @name = name
        @cash = cash
        @fav_song = fav_song
        @fav_genre = fav_genre
        @tab = tab
    end

    def change_total_cash(amount)
        @cash += amount
    end

    def change_tab_amount(amount)
        @tab.add(amount)
    end

    def change_fav_song(song_name)
        @fav_song = song_name
    end

    def change_fav_genre(genre)
        @fav_genre = genre
    end
end