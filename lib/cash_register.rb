# a discount of 20 means the customer receives 20% off of their total price).
#Note that 100.class returns Integer while 100.0.class returns Float. (see: apply_discount tab)
#void_last_transaction - make an additional attribute accessor and keep track of that last transaction amount somehow.

require "pry" 

class CashRegister 
    attr_accessor  :total, :discount, :quantity, :new_register, :last_transaction_amt

    def initialize(discount=0)
        @total = 0
        @discount = discount 
        @new_register = []
        @last_transaction_amt
    end

    def add_item(item, price, quantity = 1)
        @total += price * quantity
        @last_transaction_amt = price * quantity
        
        count = 0 
        while count < quantity do 
            self.new_register << item
            count+=1
        end
    end 

    def apply_discount
        #1000-1000*20/100
         
        if @discount > 0
            @total = @total - (@total * (@discount.to_f/100))
            p "After the discount, the total comes to $#{@total.to_i}."
        else 
           p "There is no discount to apply."
        end
    end 
    
    def items
        @new_register
    end

    def void_last_transaction
        @total = @total - @last_transaction_amt
    end

end

