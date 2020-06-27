class Room

    attr_reader :room_name, :room_guests, :songs, :admission_fee, :till

    def initialize(room_name)
        @room_name = room_name
        @room_guests = []
        @songs = []
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
        charge_guest(guest)
        @room_guests << guest
    end

    def check_out_guest(guest)
        @room_guests.delete(guest)
    end

end