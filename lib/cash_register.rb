require 'pry'
class CashRegister
    attr_accessor :total, :discount, :last_transaction
    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @item = []
    end

    def add_item(item,price,quantity=1)
        self.total += price*quantity
        quantity.times do
            @item << item
            @last_transaction = price*quantity
        end
    end
    def apply_discount
       if self.discount != nil
        self.total = (100-self.discount)*self.total.to_f/100.0
        "After the discount, the total comes to $#{self.total.to_i}."
       else
        "There is no discount to apply."
       end
    end

    def items
        @item
    end

    def void_last_transaction
        @total -= @last_transaction
    end
end