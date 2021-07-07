# a discount of 20 means the customer receives 20% off of their total price).
#Note that 100.class returns Integer while 100.0.class returns Float. (see: apply_discount tab)
#void_last_transaction - make an additional attribute accessor and keep track of that last transaction amount somehow.

#require "lib/cash_register.rb" #only if trying to load a diff. file into this class

#require "pry"
class CashRegister 
    attr_accessor  :total, :discount, :quantity, :new_register, :last_transaction_amt

    # describe '::new' do
    #     it 'sets an instance variable @total on initialization to zero' do
    #       expect(cash_register.instance_variable_get(:@total)).to eq(0)
    #     end

    # it 'optionally takes an employee discount on initialization' do
    #     expect(cash_register_with_discount.discount).to eq(20)
    #   end
    # end

    # describe '#total' do
    #     it 'returns the current total' do
    #       cash_register.total = 100
    #       expect(cash_register.total).to eq(100)
    #     end
    #   end

    def initialize(discount=0) 
        #puts "discount = #{discount}"
        @total = 0
        @discount = discount 
        @new_register = []
    end

    # describe '#add_item' do
    #     it 'accepts a title and a price and increases the total' do
    #       expect{cash_register.add_item("eggs", 0.98)}.to change{cash_register.total}.by(0.98)
    #     end
    
    #     it 'also accepts an optional quantity' do
    #       expect{cash_register.add_item("book", 5.00, 3)}.to change{cash_register.total}.by(15.00)
    #     end
    
    #     it "doesn't forget about the previous total" do
    #       cash_register.add_item("Lucky Charms", 4.5)
    #       expect(cash_register.total).to eq(4.5)
    #       cash_register.add_item("Ritz Crackers", 5.0)
    #       expect(cash_register.total).to eq(9.5)
    #       cash_register.add_item("Justin's Peanut Butter Cups", 2.50, 2)
    #       expect(cash_register.total).to eq(14.5)
    #     end
    #   end

    def add_item(item, price, quantity = 1)
        #puts "item added - #{item} - #{price} - #{quantity}"
        @total += price * quantity
        @last_transaction_amt = price * quantity
        

    # describe '#items' do
    #     it 'returns an array containing all items that have been added' do
    #       new_register = CashRegister.new
    #       new_register.add_item("eggs", 1.99)
    #       new_register.add_item("tomato", 1.76, 3)
    #       expect(new_register.items).to eq(["eggs", "tomato", "tomato", "tomato"])
     #     end
    #   end       
        count = 0 
        while count < quantity do 
            self.new_register << item
            #p self.new_register
            count+=1
        end
    end 

    # describe '#apply_discount' do
    #     context 'the cash register was initialized with an employee discount' do
    #       it 'applies the discount to the total price' do
    #         cash_register_with_discount.add_item("macbook air", 1000)
    #         cash_register_with_discount.apply_discount
    #         expect(cash_register_with_discount.total).to eq(800)
    #       end

#     it 'returns success message with updated total' do
#         cash_register_with_discount.add_item("macbook air", 1000)
#         expect(cash_register_with_discount.apply_discount).to eq("After the discount, the total comes to $800.")
#       end

#       it 'reduces the total' do
#         cash_register.total = 0
#         cash_register_with_discount.add_item("macbook air", 1000)
#         expect{cash_register_with_discount.apply_discount}.to change{cash_register_with_discount.total}.by(-200)
#       end
#     end

#     context 'the cash register was not initialized with an employee discount' do
#       it 'returns a string error message that there is no discount to apply' do
#         expect(cash_register.apply_discount).to eq("There is no discount to apply.")
#       end
#     end
#   end


    def apply_discount
        #1000-1000*20/100
        # binding.pry
        if @discount > 0
            @total = @total - (@total * (@discount.to_f/100))
            p "After the discount, the total comes to $#{@total.to_i}."
        else 
           p "There is no discount to apply."
        end
        #binding.pry
    end 
    
    # describe '#items' do
    #     it 'returns an array containing all items that have been added' do
    #       new_register = CashRegister.new
    #       new_register.add_item("eggs", 1.99)
    #       new_register.add_item("tomato", 1.76, 3)
    #       expect(new_register.items).to eq(["eggs", "tomato", "tomato", "tomato"])
    #     end
    
    def items
        @new_register
    end

    # describe '#void_last_transaction' do
    #     it 'subtracts the last item from the total' do
    #       cash_register.add_item("apple", 0.99)
    #       cash_register.add_item("tomato", 1.76)
    #       cash_register.void_last_transaction
    #       expect(cash_register.total).to eq(0.99)
    #     end

    def void_last_transaction
        @total = @total - @last_transaction_amt
    end

end

