//
//  MainScreen.swift
//  crypto-glass
//
//  Created by Despo on 17.06.25.
//

import SwiftUI

struct MainScreen: View {
  @State private var vm = MainScreenViewModel()
  @State private var isVisible = false
  var body: some View {
    GlassEffectContainer {
      ZStack {
        BlurEllipses()
        
        ScrollView {
          VStack(spacing: 30) {
            NFTView(vm: vm)
            LastListedCrypto(vm: vm)
            
            Button("click") {
              isVisible.toggle()
            }
          }
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
      .padding(.top, 20)
      .background(.bgCol)
      .sheet(isPresented: $isVisible) {
        ZStack{
          BlurEllipses()
          Text("test")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .presentationDetents([.medium])
      }
      .onAppear(perform: {
        print(vm.isLoading)
      })
      .onChange(of: vm.isLoading) {
        print(vm.isLoading)
      }
    }
  }
}

