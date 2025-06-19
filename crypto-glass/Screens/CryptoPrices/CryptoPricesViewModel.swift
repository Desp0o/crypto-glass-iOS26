//
//  CryptoPricesViewModel.swift
//  crypto-glass
//
//  Created by Despo on 19.06.25.
//

import Observation
import IzziRequest
import Foundation

@MainActor
@Observable
final class CryptoPricesViewModel {
  private let izziReq: IzziRequestProtocol
  private let api = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?limit=20"
  private let headers = ["X-CMC_PRO_API_KEY": "6a830d09-6bcb-448a-81e4-e204ada3046c"]
  private var updateTask: Task<Void, Never>?
  var cryptoCoins: [LatestCrypto] = []

  init(izziReq: IzziRequestProtocol = IzziRequest() as IzziRequestProtocol) {
    self.izziReq = izziReq
  }
  
  private func cryptoCoinsStream() -> AsyncStream<LatestResponseModel> {
    AsyncStream { continuation in
      let timerTask = Task {
        while !Task.isCancelled {
          do {
            let response: LatestResponseModel = try await self.fetchCryptoCoins()
            continuation.yield(response)
            
            try await Task.sleep(for: .seconds(5))
          } catch {
            if !Task.isCancelled {
              print(error, "❌")
            }
            break
          }
        }
        continuation.finish()
      }
      
      continuation.onTermination = { _ in
        timerTask.cancel()
      }
    }
  }
  
  private func fetchCryptoCoins() async throws -> LatestResponseModel {
    return try await izziReq.request(urlString: api, method: .GET, headers: headers)
  }
  
  func startPriceUpdates() {
    stopPriceUpdates()
    
    updateTask = Task {
      for await updatedPrices in cryptoCoinsStream() {
        guard !Task.isCancelled else { break }
        
        cryptoCoins = updatedPrices.data
      }
    }
  }
  
  func stopPriceUpdates() {
    updateTask?.cancel()
    updateTask = nil
  }
  
}

