//
//  MainScreen.swift
//  crypto-glass
//
//  Created by Despo on 17.06.25.
//

import SwiftUI
import Kingfisher

struct MainScreen: View {
  @State private var vm = MainScreenViewModel()
  
  var body: some View {
    GlassEffectContainer {
      ZStack {
        BlurEllipses()
        
        ScrollView {
          VStack(spacing: 30) {
            NFTView(vm: vm)
            LastListedCrypto(vm: vm)
            NewsFeed(vm: vm)
          }
        }
      }
      .scrollIndicators(.hidden)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    .padding(.top, 20)
    .background(.bgCol)
    .sheet(isPresented: $vm.isVisible) {
      CryptoDetail(vm: vm)
        .presentationDetents([.medium])
    }
    .task {
      vm.fetchLatest()
      vm.fetchNews()
    }
  }
}

