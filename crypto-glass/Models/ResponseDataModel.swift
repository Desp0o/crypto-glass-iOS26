//
//  ResponseDataModel.swift
//  crypto-glass
//
//  Created by Despo on 18.06.25.
//


struct ResponseDataModel: Codable {
  let data: [CryptoList]
}

struct CryptoList: Codable {
  let id: Int
  let rank: Int
  let name: String
  let symbol: String
}