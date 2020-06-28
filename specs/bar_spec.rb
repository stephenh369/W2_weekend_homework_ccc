require('minitest/autorun')
require('minitest/reporters')

require_relative('../Bar')
require_relative('../Drink')
require_relative('../Guest')
require_relative('../Tab')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new()

class TestBar < Minitest::Test

    def setup()
        @bar1 = Bar.new("Stage Fright")

        @drink1 = Drink.new("Beer", 3.00)
        @drink2 = Drink.new("Whisky", 2.50)
        @drink3 = Drink.new("Vodka", 2.00)

        @guest1 = Guest.new("Stephen", 100, "Highway To Hell", "Rock", Tab.new(@guest1))
        @guest2 = Guest.new("Erin", 1000, "Bootylicious", "Pop", Tab.new(@guest2))
        @guest5 = Guest.new("Karen", 1, "Firework", "Pop", Tab.new(@guest5))
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

    def test_sell_drink()
        @bar1.add_drink(@drink1)
        @bar1.add_drink(@drink3)
        @bar1.sell_drink(@guest1, @drink1)
        @bar1.sell_drink(@guest5, @drink3)
        assert_equal(97, @guest1.cash())
        assert_equal(1, @guest5.cash())
        assert_equal(253, @bar1.till())
        assert_equal(3, @guest1.tab().amount())
        assert_equal("We don't have that.", @bar1.sell_drink(@guest1, @drink2))
    end

end