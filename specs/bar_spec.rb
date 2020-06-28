require('minitest/autorun')
require('minitest/reporters')

require_relative('../Bar')
require_relative('../Drink')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new()

class TestBar < Minitest::Test

    def setup()
        @bar1 = Bar.new("Stage Fright")

        @drink1 = Drink.new("Beer", 3.00)
        @drink2 = Drink.new("Whisky", 2.50)
        @drink3 = Drink.new("Vodka", 2.00)
    end

    def test_get_bar_name()
        assert_equal("Stage Fright", @bar1.bar_name())
    end

    def test_add_drink()
        @bar1.add_drink(@drink1)
        @bar1.add_drink(@drink2)
        @bar1.add_drink(@drink3)
        assert_equal([@drink1, @drink2, @drink3], @bar1.drinks)
    end

end