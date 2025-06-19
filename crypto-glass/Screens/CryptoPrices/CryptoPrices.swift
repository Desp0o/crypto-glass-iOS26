//
//  CryptoPrices.swift
//  crypto-glass
//
//  Created by Despo on 17.06.25.
//

import SwiftUI
import Kingfisher

struct CryptoPrices: View {
  @State private var vm = CryptoPricesViewModel()
  
    var body: some View {
      ZStack {
        BlurEllipses()
        
        VStack {
          ScrollView {
            LazyVStack {
              ForEach(vm.cryptoCoins, id: \.id) { coin in
                HStack(spacing: 20) {
                  KFImage(URL(string: "https://s2.coinmarketcap.com/static/img/coins/32x32/\( coin.id).png"))
                  
                  VStack(alignment: .leading) {
                    Text(coin.symbol)
                      .customStyle(weight: .bold)
                                             
                    Text("$ \(String(format: "%.2f", coin.quote.USD.price))")
                      .customStyle(size: 14, weight: .semibold)
                  }
                  
                  VStack(alignment: .leading) {
                    Text("Circular: \(String(format: "%.2f", coin.circulatingSupply))")
                      .customStyle(size: 12)
                    Text("Total : \(String(format: "%.2f", coin.totalSupply))")
                      .customStyle(size: 12)
                  }
                  
                  Group {
                    if coin.quote.USD.percentChange24H > 0 {
                      Image(systemName: IconEnum.arrowUp.rawValue)
                    } else {
                      Image(systemName: IconEnum.arrowDown.rawValue)
                    }
                  }
                  .symbolRenderingMode(.monochrome)
                  .foregroundStyle(coin.quote.USD.percentChange24H >= 0 ? .green : .red)
                  
                }
                .frame(maxWidth: .infinity)
                .padding(20)
                .glassEffect(in: RoundedRectangle(cornerRadius: 22))
              }
            }
            .padding(20)
            .scrollTargetLayout()
          }
          .scrollIndicators(.hidden)
          .scrollTargetBehavior(.viewAligned)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      }
      .background(.bgCol)
      .task {
        vm.startPriceUpdates()
      }
      .onDisappear {
        vm.stopPriceUpdates()
      }
    }
}

#Preview {
    CryptoPrices()
}
