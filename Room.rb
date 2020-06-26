class Room

    attr_reader :room_name, :room_guests, :songs

    def initialize(room_name)
        @room_name = room_name
        @room_guests = []
        @songs = []
    end

end