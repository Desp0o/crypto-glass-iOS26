//
//  NewsResponseModel.swift
//  crypto-glass
//
//  Created by Despo on 19.06.25.
//

import Foundation

struct NewsResponseModel: Codable {
  let articles: [Article]
}

struct Article: Codable, Hashable {
  let author: String?
  let title: String?
  let urlToImage: String?
  let content: String?
}
