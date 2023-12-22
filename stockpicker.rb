def stock_picker(prices)
    # Check if there are enough days to pick stocks
    if prices.length < 2
        puts "Not enough days to pick stocks."
        return nil
    end

    # Initialize variables to keep track of the best buy and sell days, and the maximum profit
    buy_day = 0
    sell_day = 1
    max_profit = prices[sell_day] - prices[buy_day]

    # Iterate through each day as a potential buy day
    prices.each_with_index do |buy_price, buy_index|
        # Iterate through days after the buy day as potential sell days
        (buy_index + 1).upto(prices.length - 1) do |sell_index|
            sell_price = prices[sell_index]
            current_profit = sell_price - buy_price

            # Update buy and sell days if the current profit is greater than the maximum profit
            if current_profit > max_profit
                buy_day = buy_index
                sell_day = sell_index
                max_profit = current_profit
            end
        end
    end

    # Return an array containing the best buy day and sell day
    [buy_day, sell_day]
end

# Example usage:
stock_prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]
result = stock_picker(stock_prices)

if result
    buy_day, sell_day = result
    puts "Buy on day #{buy_day}, sell on day #{sell_day} for a profit of $#{stock_prices[sell_day] - stock_prices[buy_day]}."
else 
    puts "No profitable stock pick."
end