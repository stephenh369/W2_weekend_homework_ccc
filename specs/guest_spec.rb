require('minitest/autorun')
require('minitest/reporters')

require_relative('../Guest')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new()

class TestGuest < Minitest::Test

    def setup()
        @guest1 = Guest.new("Stephen", 100, "Highway To Hell", "Rock")
        @guest2 = Guest.new("Erin", 1000, "Firework", "Pop")
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

end