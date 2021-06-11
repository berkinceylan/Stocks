//
//  StocksService.swift
//  Stocks
//
//  Created by Berkin Ceylan on 11.06.2021.
//

import Foundation
import _Concurrency

struct Stock {
    let name: String
    let price: Double
}

class StocksService: ObservableObject {
    
    private func getStocks(_ completion: @escaping ([Stock]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let stocks = [
                Stock(name: "Apple", price: Double.random(in: 100...200)),
                Stock(name: "Google", price: Double.random(in: 1000...2000)),
                Stock(name: "Microsoft", price: Double.random(in: 300...500)),
                Stock(name: "TurkishKit", price: Double.random(in: 100...200)),
                Stock(name: "Ventence", price: Double.random(in: 1000...2000)),
                Stock(name: "Vestel", price: Double.random(in: 300...500)),
                Stock(name: "Starbucks", price: Double.random(in: 100...200)),
                Stock(name: "IBM", price: Double.random(in: 1000...2000)),
                Stock(name: "Bitcoin", price: Double.random(in: 300...500)),
                Stock(name: "SpaceX", price: Double.random(in: 100...200)),
                Stock(name: "Nike", price: Double.random(in: 1000...2000)),
                Stock(name: "Adidas", price: Double.random(in: 300...500))
            ]
            completion(stocks)
        }
    }
    
    func getStocks() async -> [Stock] {
        
        await withUnsafeContinuation { continuation in
            getStocks { result in
                continuation.resume(returning: result)
            }
        }
        
    }
    
}
