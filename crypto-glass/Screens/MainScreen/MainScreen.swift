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
          VStack {
            
            NFTView(vm: vm)
          }
          
          if vm.isLoading {
            ProgressView()
          }
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
      .padding(.top, 20)
      .background(.bgCol)
    }
  }
}

