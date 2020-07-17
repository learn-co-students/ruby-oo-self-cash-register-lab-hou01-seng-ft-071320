require 'pry'
class CashRegister

    attr_accessor :total, :discount, :shopping_cart 

    def initialize(discount = 0)
        @discount = discount 
        @total = 0.00
        @shopping_cart = []
    end

    @total = 0.00 

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        @shopping_cart << {:item => title, :price => price, :quantity => quantity}
    end
    
    def apply_discount
        if @discount != 0
            @total = @total - (@total * (@discount/100.0))
            "After the discount, the total comes to $#{@total.to_i}."
        else 
            "There is no discount to apply."
        end
    end

    def items
        item_list = []
        item_list = @shopping_cart.collect do |hash| 
            [].fill(hash[:item], 0, hash[:quantity])
        end
        item_list.flatten 
        
    end

    def void_last_transaction
        @total = @total - (@shopping_cart[-1][:price] * @shopping_cart[-1][:quantity])

    end

end

