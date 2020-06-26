require('minitest/autorun')
require('minitest/reporters')

require_relative('../Room')
require_relative('../Guest')
require_relative('../Song')
require_relative('../SongCollection')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new()

class TestRoom < Minitest::Test

    def setup()

    end

end