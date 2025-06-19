//
//  SearchViewModel.swift
//  crypto-glass
//
//  Created by Despo on 19.06.25.
//


import Observation
import IzziRequest
import Foundation

@MainActor
@Observable
final class SearchViewModel {
  var foundCrypto: LatestCrypto? = nil
  var fetchedCryptos: [LatestCrypto] = []
  var noResutl: String = ""
  private let izziReq: IzziRequestProtocol
  private let api = "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?limit=20"
  private let headers = ["X-CMC_PRO_API_KEY": "6a830d09-6bcb-448a-81e4-e204ada3046c"]
  
  init(izziReq: IzziRequestProtocol = IzziRequest()) {
    self.izziReq = izziReq
  }
  
  func fetchCryptoCoins() {
    Task {
      do {
        let response: LatestResponseModel = try await izziReq.request(urlString: api, method: .GET, headers: headers)
        fetchedCryptos = response.data
        print(fetchedCryptos)
      } catch {
        print(error)
      }
    }
  }
  
  func searchCrypto(query: String) {
    let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
    
    guard !trimmedQuery.isEmpty else {
      foundCrypto = nil
      noResutl = ""
      return
    }
    
    if let match = fetchedCryptos.first(where: {
      $0.symbol.localizedCaseInsensitiveCompare(trimmedQuery) == .orderedSame
      || $0.name.localizedCaseInsensitiveContains(trimmedQuery)
    }) {
      foundCrypto = match
      noResutl = ""
    } else {
      foundCrypto = nil
      noResutl = "No results found for “\(query)”"
    }
  }
}
