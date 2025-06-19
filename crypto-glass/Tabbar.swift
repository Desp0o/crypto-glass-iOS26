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
        Tab("Home",systemImage: IconEnum.house.rawValue) {
          NavigationStack {
            MainScreen()
          }
        }
        
        Tab("Coins", systemImage: IconEnum.chart.rawValue) {
          NavigationStack {
            CryptoPrices()
          }
        }
        
        Tab(role: .search) {
          Search()
        }
      }
      .tint(.purple)
    }
}
