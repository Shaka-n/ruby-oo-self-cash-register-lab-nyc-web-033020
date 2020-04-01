require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :last_item, :last_price, :last_count

    def initialize(*discount)
        @total = 0
        @discount=discount[0]
        @items = Array.new
    end

    def add_item(title, price, count=1)
        self.total += price * count
        count.times {@items << title }
        self.last_item = title
        self.last_price = price
        self.last_count = count

    end

    def apply_discount
        if @discount
        self.total -= @total * @discount / 100
        return "After the discount, the total comes to $#{@total}."
        else 
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        #binding.pry
        @total = @total - @last_price * @last_count
        @items.pop
        if @items[0]== nil
            @total = 0.0
        end
    end


end
