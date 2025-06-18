//
//  LastListedCrypto.swift
//  crypto-glass
//
//  Created by Despo on 18.06.25.
//

import SwiftUI
import Kingfisher

struct LastListedCrypto: View {
  let vm: MainScreenViewModel
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("Last Listed")
        .customStyle(size: 22, weight: .bold)
        .padding(.leading, 20)
      
      if !vm.isLoading {
        ScrollView(.horizontal) {
          LazyHStack(spacing: 20) {
            ForEach(vm.latestListedCrypto, id: \.id) { crypto in
              VStack {
                KFImage(URL(string: "https://s2.coinmarketcap.com/static/img/coins/32x32/\(crypto.id).png"))
                
                HStack {
                  Text(crypto.name)
                    .customStyle(weight: .bold)
                  
                  Spacer()
                }
                
                HStack {
                  Text("Price")
                    .customStyle(size: 14, weight: .bold)
                  
                  Text("\(String(format: "%.2f", crypto.quote.USD.price)) USD")
                    .customStyle(size: 14, weight: .bold)
                  Spacer()
                }
                
              }
              .padding(10)
              .glassEffect(in: RoundedRectangle(cornerRadius: 22))
            }
          }
          .padding(.horizontal, 20)
          .scrollTargetLayout()
        }
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.viewAligned)
      } else {
        ScrollView(.horizontal) {
          HStack(spacing: 20) {
            ForEach(0...3, id: \.self) { _ in
              VStack {
                ProgressView()
                  .scaleEffect(1.5)
                  .tint(.elipse2Col)
              }
              .frame(width: 180, height: 100)
              .glassEffect(in: RoundedRectangle(cornerRadius: 22))
            }
          }
          .padding(.horizontal, 20)
        }
      }
    }
  }
}
