class Tab

    attr_reader :guest, :amount

    def initialize(guest)
        @guest = guest
        @amount = 0

    end

    def add(amount)
        @amount += amount
    end

end