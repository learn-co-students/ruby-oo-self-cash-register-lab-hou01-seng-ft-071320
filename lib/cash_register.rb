class CashRegister
    attr_accessor :items, :discount, :total, :last_transaction
    def initialize(d=0)
        @total = 0
        @discount = d
        @items = []
    end
    def add_item(t, a, q=1)
        @total += a * q
        q.times do
            @items << t
        end
        @last_transaction = a * q
    end
    def apply_discount
        if @discount != 0
            @total = (total * ((100.0 - discount.to_f)/100)).to_i
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end
    def void_last_transaction
        self.total = self.total - self.last_transaction
    end
end