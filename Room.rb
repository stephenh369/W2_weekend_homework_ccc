class Room

    attr_reader :room_name, :room_guests, :songs

    def initialize(room_name)
        @room_name = room_name
        @room_guests = []
        @songs = []
    end

    def check_in_guest(guest)

    end

    def check_out_guest(guest)

    end
end