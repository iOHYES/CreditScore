//
//  ContentView.swift
//  ClearScore
//
//  Created by Ujjwal on 27/02/2021.
//

import SwiftUI

struct ContentView: View {
  
  @State private var score: String = ""
  @State private var maxScoreValue: String = ""

  @State var circleProgress: CGFloat = 0.0
    
  
  let gradient = RadialGradient(
          gradient   : Gradient(colors: [.yellow, .orange]),
          center     : UnitPoint(x: 0.25, y: 0.25),
          startRadius: 0.8,
          endRadius  : 200
      )
  
    var body: some View {
      NavigationView
      {
        
        ZStack{
          
          VStack
          {
            
            Text("Your credit score is")
              .fontWeight(.regular)
              .font(.system(size:24))

            Text(score)
              .fontWeight(.ultraLight)
              .foregroundColor(.yellow)
              .font(.system(size:80))

            Text("out of \(maxScoreValue)")
              .fontWeight(.regular)
              .font(.system(size:24))

          }
          
          Circle()
            .trim(from: 0.0, to: circleProgress)
            .stroke(gradient, lineWidth: 4)
            .padding(.horizontal,35)
            .rotationEffect(.degrees(-90))
            

          
          Circle()
            .stroke(Color.black, lineWidth: 2)
            .padding(.horizontal,28)
          
        }
        .navigationTitle("Dashboard")
        .navigationBarTitleDisplayMode(.inline)
        
      }
      .onAppear
      {
        var viewModel = CreditScoreViewModel()
        viewModel.delegate = self
        viewModel.getCreditReport()
      }
    }
  
  func startLoading(creditScore: Int, totalScore: Int) {

    for _ in 0...creditScore {
      withAnimation() {
        if self.circleProgress <= CGFloat(creditScore)/CGFloat(totalScore) {
          self.circleProgress += 0.1
        }
      }
    }
  }
  
}

extension ContentView: CreditReportDelegate
{
  
  func didReciveResponse(response: CreditReport) {
    self.score = "\(response.creditReportInfo.score)"
    self.maxScoreValue = "\(response.creditReportInfo.maxScoreValue)"
    self.startLoading(creditScore: response.creditReportInfo.score, totalScore: response.creditReportInfo.maxScoreValue)
    print("Credit score-\(response.creditReportInfo.score) out of \(response.creditReportInfo.maxScoreValue) ")
  }
  
  func didReciveError(error: String) {
    print("error - \(error)")
  }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//      ContentView(score:320)
//    }
//}
