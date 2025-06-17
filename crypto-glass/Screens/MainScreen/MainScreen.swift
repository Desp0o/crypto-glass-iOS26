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
          Ellipse()
            .fill(.elipseCol)
            .frame(width: 220, height: 220)
            .blur(radius: 150)
            
          Ellipse()
            .fill(.elipse2Col)
            .frame(width: 220, height: 220)
            .blur(radius: 100)
            .offset(x: UIScreen.main.bounds.width / 2 - 110, y: UIScreen.main.bounds.height / 2 - 110)
          
          ScrollView {
            VStack(alignment: .leading) {
              Text("Trending collections")
                .multilineTextAlignment(.leading)
                .fontWeight(.bold)
                .font(.system(size: 22))
                .padding(.leading, 20)
              
              ScrollView(.horizontal) {
                LazyHStack(spacing: 20) {
                  VStack(spacing: 10) {
                    HStack {
                      Image("abstract")
                        .frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 22))
                      
                      Spacer()
                    }
                    
                    HStack {
                      Text("Abstract Art")
                        .fontWeight(.bold)
                      
                      Spacer()
                    }
                    
                  }
                  .padding(10)
                  .glassEffect(in: RoundedRectangle(cornerRadius: 22))
                  
                  VStack(spacing: 10) {
                    HStack {
                      Image("abstract")
                        .frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 22))
                      
                      Spacer()
                    }
                    
                    HStack {
                      Text("Abstract Art")
                        .fontWeight(.bold)
                      
                      Spacer()
                    }
                    
                  }
                  .padding(10)
                  .glassEffect(in: RoundedRectangle(cornerRadius: 22))
                }
                .padding(.leading, 20)
              }
            }
            
          }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.bgCol)
      }
    }
}

import Observation
import IzziRequest
final class MainScreenViewModel: Observable {
  let izziReq: IzziRequestProtocol
  
  init(izziReq: IzziRequestProtocol = IzziRequest()) {
    self.izziReq = izziReq
  }
  
  let api = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/map"
  let headers = [
      "X-CMC_PRO_API_KEY": "6a830d09-6bcb-448a-81e4-e204ada3046c"
  ]

    
  func foo() {
      Task {
        do {
          let response: ResponseDataModel =  try await izziReq.request(
            urlString: api,
            method: .GET,
            headers: headers
          )
          print("🟢")
          print(response.data[0].name)
        } catch {
          print(error)
        }
      }
    }

  
}


struct ResponseDataModel: Codable {
  let data: [CryptoList]
}

struct CryptoList: Codable {
  let id: Int
  let rank: Int
  let name: String
  let symbol: String
}
