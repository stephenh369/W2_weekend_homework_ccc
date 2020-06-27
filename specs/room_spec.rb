require('minitest/autorun')
require('minitest/reporters')

require_relative('../Room')
require_relative('../Guest')
require_relative('../Song')
require_relative('../SongCollection')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new()

class TestRoom < Minitest::Test

    def setup()
        @room1 = Room.new("Rock Room", "Rock")
        @room2 = Room.new("Hip Hop Room", "Hip Hop")
        @room3 = Room.new("Pop Room", "Pop")
        
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

    def test_change_till_cash()
        @room1.change_till_cash(10)
        assert_equal(510, @room1.till())
    end

    def test_check_in_guest()
        @room1.check_in_guest(@guest1)
        assert_equal([@guest1], @room1.room_guests())
        assert_equal(90, @guest1.cash())
        assert_equal(510, @room1.till())
    end

    def test_check_out_guest()
        @room1.check_in_guest_free(@guest1)
        @room1.check_in_guest_free(@guest2)
        @room1.check_in_guest_free(@guest3)
        @room1.check_out_guest(@guest1)
        assert_equal([@guest2, @guest3], @room1.room_guests())
    end

    def test_add_song()
        @room1.add_song(@song1)
        assert_equal([@song1], @room1.songs())
    end

    def test_add_song_wrong_genre()
        @room1.add_song(@song2)
        assert_equal("Error! Wrong genre!", @room1.add_song(@song2))
        assert_equal([], @room1.songs())
    end

    def test_exceed_capacity()
        @room1.check_in_guest(@guest1) 
        @room1.check_in_guest(@guest2)
        @room1.check_in_guest(@guest3)
        @room1.check_in_guest(@guest4)
        @room1.check_in_guest(@guest5)
        assert_equal(4, @room1.room_guests().count())
        assert_equal("Error! Room is full!", @room1.check_in_guest(@guest5))
    end

    def test_fav_song_present()
        @room1.add_song(@song1)
        @room1.fav_song_present(@guest1)
        assert_equal("Woohoo!", @room1.fav_song_present(@guest1))
        assert_equal("This room sucks.", @room1.fav_song_present(@guest4))
    end
end