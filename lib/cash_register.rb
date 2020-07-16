require 'pry'
class CashRegister
    attr_accessor :total, :discount, :items

    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @items = []
    end


    def add_item(title, price, quantity = nil)
        if quantity != nil
            index = 0
            while index < quantity
                @items << title
                index += 1
            end 
            @total += (price * quantity)
        else 
            @total += price
            @items << title
        end
        if @items.last == title && quantity != nil
            @last_price = (price * quantity)
        else 
            @last_price = price
        end
        @total
    end

    def apply_discount
        if @discount != nil
            @total = @total - (@total * (@discount / 100.0))
            return "After the discount, the total comes to $#{@total.to_i}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total -= @last_price
    end
end
