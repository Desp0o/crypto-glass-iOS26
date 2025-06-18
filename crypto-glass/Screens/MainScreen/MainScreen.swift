//
//  MainScreen.swift
//  crypto-glass
//
//  Created by Despo on 17.06.25.
//

import SwiftUI

struct MainScreen: View {
  @State private var vm = MainScreenViewModel()
  var body: some View {
    GlassEffectContainer {
      ZStack {
        BlurEllipses()
        
        ScrollView {
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
              .padding(.leading, 20)
              .scrollTargetLayout()
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned)
          }
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
      .padding(.top, 20)
      .background(.bgCol)
    }
  }
}

