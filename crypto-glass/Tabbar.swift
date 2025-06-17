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
          MainScreen()
        }
        
        Tab("Coins", systemImage: IconEnum.chart.rawValue) {
          CryptoPrices()
        }
        
        Tab(role: .search) {
          Search()
        }
      }
      .tint(.purple)
    }
}
