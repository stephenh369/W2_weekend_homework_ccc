require('minitest/autorun')
require('minitest/reporters')

require_relative('../Room')
require_relative('../Guest')
require_relative('../Song')
require_relative('../SongCollection')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new()

class TestRoom < Minitest::Test

    def setup()
        @room1 = Room.new("Rock Room")
        @room2 = Room.new("Hip Hop Room")
        @room3 = Room.new("Pop Room")
        
        @guest1 = Guest.new("Stephen", 100, "Highway To Hell", "Rock")
        @guest2 = Guest.new("Erin", 1000, "Bootylicious", "Pop")
        @guest3 = Guest.new("Big Chungus", 9000, "Without Me", "Hip Hop")
        @guest4 = Guest.new("Lil Doggo", 420, "Lose Yourself", "Hip Hop")
        @guest5 = Guest.new("Karen", 1, "Firework", "Pop")
        
        @song1 = Song.new("AC/DC", "Highway To Hell", "Rock")
        @song2 = Song.new("Eminem", "Lose Yourself", "Hip Hop")
        @song3 = Song.new("Katy Perry", "Firework", "Pop")
        @song4 = Song.new("Eminem", "Without Me", "Hip Hop")
        @song5 = Song.new("Destiny's Child", "Bootylicious", "Pop")

        @songs = [@song1, @song2, @song3, @song4, @song5]
        @song_collection = SongCollection.new(@songs)
    end

    def test_check_in_guest_free()
        @room1.check_in_guest_free(@guest1)
        assert_equal([@guest1], @room1.room_guests())
    end

    def test_charge_guest()
        @room1.charge_guest(@guest1)
        assert_equal(90, @guest1.cash())
    end

    def test_check_in_guest()
        @room1.check_in_guest(@guest1)
        assert_equal([@guest1], @room1.room_guests())
        assert_equal(90, @guest1.cash())
    end

    def test_check_out_guest()
        @room1.check_in_guest_free(@guest1)
        @room1.check_in_guest_free(@guest2)
        @room1.check_in_guest_free(@guest3)
        @room1.check_out_guest(@guest1)
        assert_equal([@guest2, @guest3], @room1.room_guests())
    end

end