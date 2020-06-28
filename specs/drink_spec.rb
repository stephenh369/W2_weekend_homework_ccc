require('minitest/autorun')
require('minitest/reporters')

require_relative('../Drink')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new()

class TestDrink < Minitest::Test

    def setup()
        @drink1 = Drink.new("Beer", 3.00)
        @drink2 = Drink.new("Whisky", 2.50)
        @drink3 = Drink.new("Vodka", 2.00)
    end

    def test_get_drink_name()
        assert_equal("Beer", @drink1.drink_name())
    end

    def test_get_drink_price()
        assert_equal(3.00, @drink1.price()) 
    end

end