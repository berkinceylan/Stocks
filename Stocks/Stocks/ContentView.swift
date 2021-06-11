//
//  ContentView.swift
//  Stocks
//
//  Created by Berkin Ceylan on 11.06.2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var stockListVM = StockListViewModel()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(stockListVM.stocks, id: \.name) { stock in
                    HStack{
                        Label(stock.name, systemImage: "dollarsign.square.fill")
                        Spacer()
                        Text(stock.price.formatted(.currency(code: "USD")))
                    }
                }
            }.task {
                stockListVM.getAllStocks()
            }.refreshable {
                stockListVM.getAllStocks()
            }
            .navigationTitle("Stocks")
        }
        .progressViewStyle(CircularProgressViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
