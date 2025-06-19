//
//  NewsScreen.swift
//  crypto-glass
//
//  Created by Despo on 19.06.25.
//

import SwiftUI
import Kingfisher

struct NewsScreen: View {
  let news: Article
  
  var body: some View {
    ZStack {
      BlurEllipses()
      
      VStack(spacing: 20) {
        Text(news.title ?? "")
          .customStyle(size: 20, weight: .bold)
        
        KFImage(URL(string: news.urlToImage ?? ""))
          .resizable()
          .scaledToFill()
          .clipShape(RoundedRectangle(cornerRadius: 22))
          .clipped()
          .frame(maxWidth: .infinity)
          .frame(height: 200)
        
        Text(news.description ?? "")
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
      .padding(20)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(.bgCol)
  }
}

