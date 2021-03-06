class Room

    attr_reader :room_name, :room_guests, :songs, :admission_fee, :till, :genre, :room_capacity

    def initialize(room_name, genre)
        @room_name = room_name
        @room_guests = []
        @room_capacity = 4
        @songs = []
        @genre = genre
        @admission_fee = 10
        @till = 500
    end

    def check_in_guest_free(guest)
        @room_guests << guest
    end

    def charge_guest(guest)
        guest.change_total_cash(-@admission_fee)
     end
 
     def change_till_cash(amount)
         @till += amount
     end

    def check_in_guest(guest)
        if room_guests.count < room_capacity
            charge_guest(guest)
            @room_guests << guest
            change_till_cash(@admission_fee)
            guest.change_tab_amount(@admission_fee)
        else
            exceed_capacity()
        end
    end

    def check_out_guest(guest)
        @room_guests.delete(guest)
    end

    def add_song(song)
        if song.genre() == @genre
            @songs << song
        else
            return "Error! Wrong genre!"
        end
    end

    def exceed_capacity()
        return "Error! Room is full!"
    end

    def fav_song_present(guest)
        for song in @songs
            if song.song_name == guest.fav_song
                return "Woohoo!"
            else
                return "This room sucks."
            end
        end
    end

end