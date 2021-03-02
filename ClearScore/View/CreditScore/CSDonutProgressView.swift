//
//  CSDonutProgressView.swift
//  ClearScore
//
//  Created by Ujjwal on 01/03/2021.
//

import SwiftUI

/// Donut progress view to display the credit score percentage value
struct CSDonutProgressView: View {
  
  @Binding var progress: CGFloat
  
  var body: some View {
    Circle()
      .trim(from: 0.0, to: progress)
      .stroke(CSConstants().kGradient, lineWidth: 4)
      .padding(.horizontal,35)
      .rotationEffect(.degrees(-90))
  }
}

