class Bar
    
    attr_reader :bar_name, :drinks, :till

    def initialize(bar_name)
        @bar_name = bar_name
        @drinks = []
        @till = 250
    end

    def add_drink(drink)
        @drinks << drink
    end

    def sell_drink(guest, drink)
        for i in @drinks
            if i == drink
                if guest.cash() > i.price()
                    guest.change_total_cash(-i.price())
                    guest.change_tab_amount(i.price())
                    @till += i.price()
                end
            else
                return "We don't have that."
            end
        end
    end
end
