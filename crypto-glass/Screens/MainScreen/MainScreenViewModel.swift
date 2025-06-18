//
//  MainScreenViewModel.swift
//  crypto-glass
//
//  Created by Despo on 18.06.25.
//

import Observation
import IzziRequest
import Foundation

final class MainScreenViewModel: Observable {
  let izziReq: IzziRequestProtocol
  
  let nfts = [
    NFTModel(name: "abstract", cover: "abstract"),
    NFTModel(name: "metaverse", cover: "metaverse"),
    NFTModel(name: "pink", cover: "pink"),
    NFTModel(name: "portrait", cover: "portrait"),
    NFTModel(name: "vawe", cover: "vawe")
  ]
  
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



struct NFTModel: Identifiable {
  let id = UUID()
  let name: String
  let cover: String
}
