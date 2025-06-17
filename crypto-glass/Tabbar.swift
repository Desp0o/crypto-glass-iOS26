//
//  Tabbar.swift
//  crypto-glass
//
//  Created by Despo on 17.06.25.
//

import SwiftUI

struct Tabbar: View {
    var body: some View {
      TabView {
        Tab("Home",systemImage: "house") {
          MainScreen()
        }
        
        Tab("Coins", systemImage: "chart.bar") {
          CryptoPrices()
        }
        
        Tab(role: .search) {
          Search()
        }
      }
    }
}
