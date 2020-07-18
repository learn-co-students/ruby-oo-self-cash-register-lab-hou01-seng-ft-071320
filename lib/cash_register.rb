class CashRegister
  attr_accessor :total, :discount, :last_item
  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @all_items = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity=1)
    @last_item = price * quantity
    @total += (price*quantity)
    index = 0
    while quantity > index do
      @all_items << title
      index += 1
    end
  end

  def apply_discount
    if @discount == nil
      return "There is no discount to apply."
    else
      @total = (@total.to_f) * (100-@discount) * 0.01
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @all_items
  end

  def void_last_transaction
    @total = @total - @last_item
  end
end
