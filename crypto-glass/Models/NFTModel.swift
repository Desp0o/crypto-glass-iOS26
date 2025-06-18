//
//  NFTModel.swift
//  crypto-glass
//
//  Created by Despo on 18.06.25.
//

import Foundation

struct NFTModel: Identifiable {
  let id = UUID()
  let name: String
  let cover: String
}
