require('minitest/autorun')
require('minitest/reporters')

require_relative('../Song')
require_relative('../SongCollection')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new()

class TestSong < Minitest::Test

    def setup()
        @song1 = Song.new("AC/DC", "Highway To Hell", "Rock")
        @song2 = Song.new("Eminem", "Lose Yourself", "Hip Hop")
        @song3 = Song.new("Katy Perry", "Firework", "Pop")
        @song4 = Song.new("Eminem", "Without Me", "Hip Hop")

        @songs = [@song1, @song2, @song3, @song4]
        @song_collection = SongCollection.new(@songs)
    end

    def test_get_song_by_name()
        assert_equal("Highway To Hell", @song1.song_name())
    end

    def test_get_artist()
        assert_equal("Katy Perry", @song3.artist())
    end

    def test_get_song_genre()
        assert_equal("Rock", @song1.genre())
    end

    def test_get_songs_by_artist()
        songs_by_artist = @song_collection.get_songs_by_artist("Eminem")
        assert_equal(["Lose Yourself", "Without Me"], songs_by_artist)
    end
end