//
//  LatestResponseModel.swift
//  crypto-glass
//
//  Created by Despo on 18.06.25.
//


struct LatestResponseModel: Codable {
  let data: [LatestCrypto]
}

struct LatestCrypto: Codable {
  let id: Int
  let name: String
  let symbol: String
  let quote: Quote
}

struct USD: Codable {
  let price: Double
}

struct Quote: Codable {
  let USD: USD
}