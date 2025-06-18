//
//  MainScreenViewModel.swift
//  crypto-glass
//
//  Created by Despo on 18.06.25.
//

import Observation
import IzziRequest

@MainActor
@Observable
final class MainScreenViewModel {
  private let izzReq: IzziRequestProtocol
  private let apiLatest = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?limit=10"
  private let headers = ["X-CMC_PRO_API_KEY": "6a830d09-6bcb-448a-81e4-e204ada3046c"]
  
  var latestListedCrypto: [LatestCrypto] = []
  var selectedCrypto: LatestCrypto? = nil
  var isVisible = false
  var isLoading: Bool = true
  
  let nfts = [
    NFTModel(name: "abstract", cover: "abstract"),
    NFTModel(name: "metaverse", cover: "metaverse"),
    NFTModel(name: "pink", cover: "pink"),
    NFTModel(name: "portrait", cover: "portrait"),
    NFTModel(name: "vawe", cover: "vawe")
  ]
  
  init(izzReq: IzziRequestProtocol = IzziRequest()) {
    self.izzReq = izzReq
  }
  
  func fetchLatest() {
    Task {
      defer {
        isLoading = false
      }
      
      do {
        let response: LatestResponseModel = try await izzReq.request(urlString: apiLatest, method: .GET, headers: headers)
        latestListedCrypto = response.data
      } catch {
        print(error)
      }
    }
  }
}







//https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest
//https://pro-api.coinmarketcap.com/v1/cryptocurrency/map



