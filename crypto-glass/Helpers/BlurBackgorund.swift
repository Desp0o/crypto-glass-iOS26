//
//  BlurEllipses.swift
//  crypto-glass
//
//  Created by Despo on 18.06.25.
//

import SwiftUI

struct BlurEllipses: View {
  var body: some View {
    VStack {
      Ellipse()
        .fill(.elipseCol)
        .frame(width: 220, height: 220)
        .blur(radius: 150)
      
      Ellipse()
        .fill(.elipse2Col)
        .frame(width: 220, height: 220)
        .blur(radius: 100)
        .offset(x: UIScreen.main.bounds.width / 2 - 110, y: UIScreen.main.bounds.height / 2 - 210)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

#Preview {
  BlurEllipses()
}
