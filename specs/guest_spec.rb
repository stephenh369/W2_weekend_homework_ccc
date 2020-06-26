require('minitest/autorun')
require('minitest/reporters')

require_relative('../Guest')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new()

class TestGuest < Minitest::Test

    def setup()
        @guest1 = Guest.new("Stephen", 100, "Highway To Hell", "Rock")
        @guest2 = Guest.new("Erin", 1000, "Bootylicious", "Pop")
        @guest3 = Guest.new("Big Chungus", 9000, "Without Me", "Hip Hop")
        @guest4 = Guest.new("Lil Doggo", 420, "Lose Yourself", "Hip Hop")
    end

    def test_get_guest_name()
        assert_equal("Stephen", @guest1.name())
    end

    def test_get_guest_total_cash()
        assert_equal(9000, @guest3.cash())
    end

    def test_get_fav_song()
        assert_equal("Lose Yourself", @guest4.fav_song())
    end

    def test_get_fav_genre()
        assert_equal("Pop", @guest2.fav_genre())
    end

    def test_change_total_cash()
        @guest1.change_total_cash(150)
        assert_equal(250, @guest1.cash())
    end

    def test_change_fav_song()
        @guest1.change_fav_song("Without Me")
        assert_equal("Without Me", @guest1.fav_song())
    end

    def test_change_fav_genre()
        @guest1.change_fav_genre("Hip Hop")
        assert_equal("Hip Hop", @guest1.fav_genre())
    end

end