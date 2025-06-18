//
//  NFTView.swift
//  crypto-glass
//
//  Created by Despo on 18.06.25.
//

import SwiftUI


struct NFTView: View {
  let vm: MainScreenViewModel
  
  var body: some View {
    VStack(alignment: .leading) {
      Text("Trending collections")
        .customStyle(size: 22, weight: .bold)
        .padding(.leading, 20)
      
      ScrollView(.horizontal) {
        LazyHStack(spacing: 20) {
          ForEach(vm.nfts, id: \.id) { nft in
            VStack(spacing: 10) {
              HStack {
                Image(nft.cover)
                  .frame(width: 150, height: 150)
                  .clipShape(RoundedRectangle(cornerRadius: 22))
                
                Spacer()
              }
              
              HStack {
                Text(nft.name)
                  .customStyle(weight: .bold)
                
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
    }
  }
}
