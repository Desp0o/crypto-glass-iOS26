//
//  CryptoDetail.swift
//  crypto-glass
//
//  Created by Despo on 19.06.25.
//

import SwiftUI
import Kingfisher

struct CryptoDetail: View {
  let vm: MainScreenViewModel
  
  var body: some View {
    ZStack(alignment: .topTrailing) {
      BlurEllipses()
      
      if let crypto = vm.selectedCrypto {
        VStack(spacing: 30) {
          VStack(spacing: 10) {
            KFImage(URL(string: "https://s2.coinmarketcap.com/static/img/coins/64x64/\(crypto.id).png"))
            
            Text(crypto.name)
              .customStyle(size: 20, weight: .bold)
            
            HStack {
              Text("Volume: ")
                .customStyle(size: 20, weight: .bold)
              
              Text("\(String(format: "%.2f", crypto.quote.USD.percentChange24H)) %")
                .customStyle(size: 18)
              
              Group {
                if crypto.quote.USD.percentChange24H > 0 {
                  Image(systemName: IconEnum.arrowUp.rawValue)
                } else {
                  Image(systemName: IconEnum.arrowDown.rawValue)
                }
              }
              .symbolRenderingMode(.monochrome)
              .foregroundStyle(crypto.quote.USD.percentChange24H >= 0 ? .green : .red)
            }
          }
          
          VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 0) {
              Text("Symbol: ").fontWeight(.bold)
              Text(crypto.symbol)
            }
            
            HStack(spacing: 0) {
              Text("Circulating Supply: ").fontWeight(.bold)
              Text(String(format: "%.2f", crypto.circulatingSupply))
            }
            
            HStack(spacing: 0) {
              Text("Total Supply: ").fontWeight(.bold)
              Text(String(format: "%.2f", crypto.totalSupply))
            }
            
            if let max = crypto.maxSupply {
              HStack(spacing: 0) {
                Text("Max Supply: ").fontWeight(.bold)
                Text(String(format: "%.2f", max))
              }
            }
          }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      } else {
        Text("No Detail Info")
          .customStyle()
      }
      
      Button {
        vm.isVisible = false
      } label: {
        Image(systemName: "xmark.circle")
          .renderingMode(.template)
          .resizable()
          .frame(width: 24, height: 24)
          .foregroundStyle(.purple)
      }
      .buttonStyle(.glass)
      .offset(x: -24, y: 24)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
  }
}
