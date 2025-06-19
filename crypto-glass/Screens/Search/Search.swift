//
//  Search.swift
//  crypto-glass
//
//  Created by Despo on 17.06.25.
//

import SwiftUI
import Kingfisher

struct Search: View {
  @State private var vm = SearchViewModel()
  
  @State private var searchQuery: String = ""
  var body: some View {
    NavigationStack {
      ZStack {
        BlurEllipses()
        
        VStack {
          if let crypto = vm.foundCrypto {
            KFImage(URL(string: "https://s2.coinmarketcap.com/static/img/coins/64x64/\(crypto.id).png"))
            
            Text(crypto.name)
              .customStyle(size: 22, weight: .bold)
            
            Text(crypto.symbol)
              .customStyle(size: 18, weight: .bold)
          } else {
            Text(vm.noResutl)
              .customStyle(size: 22, weight: .bold)
          }
          
          if vm.foundCrypto == nil {
              Text("Search Coin")
              .customStyle(size: 20, weight: .bold)
          }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(.bgCol)
      .searchable(text: $searchQuery)
      .task {
        vm.fetchCryptoCoins()
      }
      .task(id: searchQuery) {
        try? await Task.sleep(nanoseconds: 400_000_000)
        vm.searchCrypto(query: searchQuery)
      }
    }
  }
}

#Preview {
  Search()
}
