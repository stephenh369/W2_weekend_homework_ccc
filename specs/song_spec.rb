require('minitest/autorun')
require('minitest/reporters')

require_relative('../Song')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new()

class TestSong < Minitest::Test

    def setup()
        @song1 = Song.new("AC/DC", "Highway To Hell", "Rock")
        @song2 = Song.new("Eminem", "Lose Yourself", "Hip Hop")
        @song3 = Song.new("Katy Perry", "Firework", "Pop")
        @song4 = Song.new("Eminem", "Without Me", "Hip Hop")
    end

    def test_get_song_by_name()
        assert_equal("Highway To Hell", @song1.song_name())
    end
end