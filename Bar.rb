class Bar
    
    attr_reader :bar_name, :drinks

    def initialize(bar_name)
        @bar_name = bar_name
        @drinks = []
    end

    def add_drink(drink)
        @drinks << drink
    end
end