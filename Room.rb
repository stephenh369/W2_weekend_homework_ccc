class Room

    attr_reader :room_name, :room_guests, :songs

    def initialize(room_name)
        @room_name = room_name
        @room_guests = []
        @songs = []
        @admission_fee = 10
    end

    def check_in_guest(guest)
        @room_guests << guest
    end

    def check_out_guest(guest)
        @room_guests.delete(guest)
    end
end