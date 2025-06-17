//
//  Extension+Text.swift
//  crypto-glass
//
//  Created by Despo on 18.06.25.
//

import SwiftUI

extension Text {
  func customStyle(size: CGFloat = 16, color: Color = .white, weight: Font.Weight = .regular, alignment: TextAlignment = .leading) -> some View {
    self.font(.system(size: size))
      .foregroundStyle(color)
      .fontWeight(weight)
      .multilineTextAlignment(alignment)
  }
}
