//
//  NewsFeed.swift
//  crypto-glass
//
//  Created by Despo on 19.06.25.
//

import SwiftUI
import Kingfisher

struct NewsFeed: View {
  let vm: MainScreenViewModel
  
  var body: some View {
    ScrollView(.horizontal) {
      VStack(alignment: .leading) {
        Text("Crypto News")
          .customStyle(size: 22, weight: .bold)
          .padding(.leading, 20)
        
        LazyHStack(spacing: 20) {
          ForEach(vm.newsFeed, id: \.self) { news in
            VStack(spacing: 10) {
              KFImage(URL(string: news.urlToImage ?? ""))
                .frame(height: 150)
                .frame(maxWidth: 260)
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 22))
              
              Text(news.title?.prefix(33) ?? "")
                .customStyle(weight: .semibold)
            }
            .padding(20)
            .glassEffect(in: RoundedRectangle(cornerRadius: 22))
          }
        }
        .padding(.horizontal, 20)
        .scrollTargetLayout()
      }
    }
    .scrollIndicators(.hidden)
    .scrollTargetBehavior(.viewAligned)
  }
}
