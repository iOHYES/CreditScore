//
//  CSDetailsView.swift
//  ClearScore
//
//  Created by Ujjwal on 01/03/2021.
//

import SwiftUI

/// View responsible for showing the credit score labels with values fetched from API
struct CSDetailsView: View {
  
  @Binding  var score: String
  @Binding  var maxScoreValue: String
  
  var body: some View {
    VStack{
      Text("Your credit score is")
        .fontWeight(.regular)
        .font(.system(size:24))
        .accessibility(identifier: "yourScoreText")
      
      Text(score)
        .fontWeight(.ultraLight)
        .foregroundColor(.yellow)
        .font(.system(size:80))
        .accessibility(identifier: "scoreLabel")
      
      HStack{
        Text("out of")
          .fontWeight(.regular)
          .font(.system(size:24))
          .accessibility(identifier: "outOfScoreLabel")
        
        Text(maxScoreValue)
          .fontWeight(.semibold)
          .font(.system(size:24))
          .accessibility(identifier: "maxScoreValueLabel")
      }
    }
  }
}
