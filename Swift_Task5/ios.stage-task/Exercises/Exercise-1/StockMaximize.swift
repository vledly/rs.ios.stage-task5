import Foundation

class StockMaximize {

    func countProfit(prices: [Int]) -> Int {
        var result = 0
        var pricesM = prices
        
        for price in prices {
            pricesM.removeFirst()
            if let max = pricesM.max(), max > price {
                result += max - price
            }
        }
        return result
    }
}
