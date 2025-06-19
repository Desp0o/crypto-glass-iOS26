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
  @State private var show = false
  @State private var selectedIndex = -1
  @Namespace private var namespace
  
  var body: some View {
    ScrollView(.horizontal) {
      VStack(alignment: .leading) {
        Text("Crypto News")
          .customStyle(size: 22, weight: .bold)
          .padding(.leading, 20)
        
        HStack(spacing: 20) {
          if !vm.isLoading {
            ForEach(vm.newsFeed.enumerated(), id: \.offset) { index, news in
              VStack {
                if show && selectedIndex == index {
                  VStack {
                    NavigationLink {
                      NewsScreen(news: news)
                    } label: {
                      Text("Read")
                        .customStyle(color: .pink)
                    }
                  }
                  .padding(.horizontal, 20)
                  .padding(.vertical, 10)
                  .glassEffect()
                }
                
                VStack(spacing: 10) {
                  KFImage(URL(string: news.urlToImage ?? ""))
                    .resizable()
                    .frame(height: 100)
                    .frame(width: 260)
                    .scaledToFill()
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 22))
                  
                  if let title = news.title {
                    Text(title.count > 30 ? "\(title.prefix(33))..." : "title")
                      .customStyle(weight: .semibold)
                  }
                }
                
                .padding(20)
                .glassEffect(in: RoundedRectangle(cornerRadius: 22))
                .glassEffectID(index, in: namespace)
                .onTapGesture {
                  withAnimation(.spring()) {
                    if selectedIndex == index, show {
                      show = false
                    } else {
                      selectedIndex = index
                      show = true
                    }
                  }
                }
              }
            }
          } else {
            ForEach(0...2, id: \.self) { obj in
              VStack {
                ProgressView()
                  .scaleEffect(1.5)
                  .tint(.bgCol)
              }
              .frame(width: 280, height: 140)
              .glassEffect(in: RoundedRectangle(cornerRadius: 22))
            }
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

