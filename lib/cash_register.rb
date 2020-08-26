require 'pry'
#spec/cash_register_spec.rb test file with

class CashRegister
  attr_accessor :total, :discount, :price, :items, :last_transaction_amount
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
    self.total += (price * quantity)
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
    #sets the last transaction amount to equal total
    self.last_transaction_amount = price * quantity
   
  end
  
  def apply_discount
    #if the dicount is > 0
    if @discount > 0
      #it takes off the amount of the discount 
      @discount = @discount/100.to_f
      #total minus the amount of discount
      @total = @total - (@total * (@discount))
      #returns message
      "After the discount, the total comes to $#{total.to_i}."
    else 
      #otherwise tells you no discount was applied
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    #Sutracts the last item from the total
   self.total = self.total - self.last_transaction_amount
  
  end
end
