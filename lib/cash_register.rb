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

        # if !@shopping_cart[title]
        #     @shopping_cart[title] = []
        # end
        # @shopping_cart[title] << price.to_i 
        
        # if quantity != nil 
        #     @shopping_cart[title][price] << quantity
        # else 
        #     quantity = 1 
        #     @shopping_cart[title][price] << quantity
        # end
        # @total += @shopping_cart[title][price]

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
        # {:item=>"eggs", :price=>1.99, :quantity=>1}, {:item=>"tomato", :price=>1.76, :quantity=>3}]
        # [ eggs, tomato, tomato, tomato]
        # array = [1,2,3,4,5]
        # array.fill(12, array.size, 4)
        
        
        item_list = []
        #item_list << @shopping_cart.each {|hash| hash[:item]}
        #@shopping_cart.each {|hash| item_list << hash[:item].}
        item_list = @shopping_cart.collect do |hash| 
            [].fill(hash[:item], 0, hash[:quantity])
        end
        item_list.flatten 
        # binding.pry
    end

    def void_last_transaction
        @total = @total - (@shopping_cart[-1][:price] * @shopping_cart[-1][:quantity])

    end

end

