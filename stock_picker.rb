require 'pry'
# binding.pry

def stock_picker(prices)
  buy_sell_days = [0,0]
  buy_price = prices[0]
  buy_day = 0
  last_price = prices[0]
  current_profit = 0
  max_profit = 0

  prices.each_with_index do |price, index|
    if price > last_price 
      current_profit = price - buy_price
      if current_profit > max_profit 
        buy_sell_days[0] = buy_day
        buy_sell_days[1] = index
        max_profit = current_profit
      end
    end
    if price < buy_price 
      buy_day = index
      buy_price = price
      current_profit = 0
    end
    last_price = price
  end

  buy_sell_days
end

puts stock_picker([17,3,6,9,15,8,6,1,10]).to_s 
puts stock_picker([17,15,13,10,5]).to_s 
puts stock_picker([2,4,6,8,10,12, 1]).to_s 