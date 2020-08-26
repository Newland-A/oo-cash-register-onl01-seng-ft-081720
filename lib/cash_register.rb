#spec/cash_register_spec.rb test file with
class CashRegister
  attr_accessor :total, :discount, :price, :items
#need @ to access instance variable
#if it is a local variable no @
#sets a default for dicount to be 0
  def initialize(discount = 0)
    #set instance variable
    @discount = discount
    #set instance total to equal 0
    @total = 0
    #set items to equal empty array
    @items = []
  end
#add_items with aruguments items, price, quantity
  def add_item(title, price, quantity = 1)
    #set instance price to equal price
    @price = price
    
    #if quantity is greater than 1
    if quantity > 1
      #sets a counter for the amount
      amount = 0
      #while the amount is less than quantity
      while amount < quantity
        #instance pushes new item
        @items << title
        #iterates in increments of 1
        amount += 1
      end
    else
      #otherwise it pushes the item into the items array
      @items << title
    end
    #Calculates the total for price * the quanity of item
    @total += price * quantity
    #sets the last transaction amount to equal total
    @last_transaction_amount = @total
    #returns total
    @total
  end
  
  def apply_discount
    #if the dicount is > 0
    if @discount > 0
      #it takes off the amount of the discount 
      @to_take_off = (price * discount)/ 100.to_f
      #total minus the amount of discount
      @total -= @to_take_off
      #returns message
      "After the discount, the total comes to $#{total.to_i}."
    else 
      #otherwise tells you no discount was applied
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    #Sutracts the last item from the total
    @total -= @last_transaction_amount
  end
end

# def apply_discount
#   if @discount > 0
#     @to_take_off = (price * discount)/100
#     @total -= @to_take_off
#     return "After the discount, the total comes to $#{total}."
#   else
#     return "There is no discount to apply."
#   end
# end

# def add_item(item, price, quantity = 1)
#   @price = price
#   @total += price * quantity
#   if quantity > 1
#     counter = 0
#     while counter < quantity
#       @items << item
#       counter += 1
#     end
#   else
#     @items << item
#   end