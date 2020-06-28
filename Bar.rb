class Bar
    
    attr_reader :bar_name, :drinks

    def initialize(bar_name)
        @bar_name = bar_name
        @drinks = []
    end
end