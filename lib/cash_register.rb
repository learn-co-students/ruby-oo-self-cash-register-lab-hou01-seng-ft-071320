require 'pry'

class CashRegister

    attr_accessor :total, :discount, :items, :cart_history

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @cart_history = []
    end

    def add_item(item_name, price, quantity = 1)
        self.total += quantity*price
        
        if quantity > 1
            i = 0 
            while i < quantity do
                @items.push(item_name)
            i += 1
            end
        else 
            @items.push(item_name)
        end

        @cart_history.push([item_name, price, quantity])
    end

    def apply_discount
        if discount != 0
        self.total = self.total * (1 - (self.discount.to_f / 100))
        "After the discount, the total comes to $#{self.total.to_i}."
        else self.discount == 0
        "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total -= cart_history.last[1]*cart_history.last[2]
    end
end