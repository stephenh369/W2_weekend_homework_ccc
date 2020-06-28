require('minitest/autorun')
require('minitest/reporters')

require_relative('../Bar')
require_relative('../Drink')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new()

class TestBar < Minitest::Test

end