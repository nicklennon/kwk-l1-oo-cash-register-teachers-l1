# Code your cash register here!
class AmazonTransaction
  attr_accessor :total, :items, :discount, :prime, :last_transaction_amount
  def initialize(discount = 0, prime = false)
    @total = 0
    @items = []
    @discount = discount
    @prime = false
  end

  #adds item and updates the total price
  def add_item(title, price, quantity = 1)
    @last_transaction_amount = price*quantity
    @total += price*quantity
    until quantity == 0  
      @items << title
      quantity -= 1
    end
  end

  #If employee gives discount
  def apply_discount
    if @discount == 0 
      "There is no discount to apply."
    else
      @total *= (1.0 - discount/100.0)
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end
  
  #If amazon prime gives shipping discount
  def amazon_prime
    if @prime == false
      "You do not have a prime membership."
    else
      "Thank you, loyal customer. Free shipping applied."
    end
  end
  
  #Bonus 1
  def cancel_order
    @total -= @last_transaction_amount
  end

end