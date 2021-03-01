//
//  CSDonutView.swift
//  ClearScore
//
//  Created by Ujjwal on 01/03/2021.
//

import SwiftUI

/// View responsible for showing the credit score details view
struct CSDonutView: View
{
  @Environment(\.colorScheme) var colorScheme
  
  // MARK:- Private properties with state observers
  @State private var score: String            = ""
  @State private var maxScoreValue: String    = ""
  @State private var circleProgress: CGFloat  = 0.0
  @State private var isError    = (false,"")
  @State private var isLoading  = true
  @State private var isAlert    = false
  
  var body: some View {
    ZStack
    {
      ///Check if the API response is received and there is no error
      ///if true, display the credit score details view
      ///if false, display the retry button
      if !isLoading && !isError.0 {
        CSDetailsView(score: $score, maxScoreValue: $maxScoreValue)
        CSDonutProgressView(progress: $circleProgress)
      }
      else {
        showLoadingOrRetryButton()
      }
      
      Circle()
        .stroke(colorScheme == .dark ? Color.white : Color.black, lineWidth: 2)
        .padding(.horizontal,28)
      
    }
    .onAppear(){
      getScore()
    }
    .alert(isPresented: $isAlert) {
      Alert(
        title: Text("Error"),
        message: Text(isError.1)
      )
    }
  }
}

// MARK:- Extension to handle loading UI and Retry button UI

extension CSDonutView
{
  fileprivate func showLoadingOrRetryButton() -> VStack<_ConditionalContent<Button<Text>, Text>> {
    return VStack {
      if isError.0
      {
        Button(action: {
          isLoading.toggle()
          isError = (false,"")
          getScore()
        }, label: {
          Text("Tap to Retry!")
            .foregroundColor(.orange)
            .font(.title2)
        })
        
      }
      else
      {
        Text("Loading...")
          .fontWeight(.ultraLight)
          .font(.system(size: 40))
      }
    }
  }
  
}

// MARK:- Extension to handle get score API and progress view UI

extension CSDonutView {
  
  private func getScore()
  {
    var viewModel = CSViewModel()
    viewModel.delegate = self
    viewModel.getCreditReport()
  }
  
  private func startLoading(creditScore: Int, totalScore: Int)
  {
    for _ in 0...creditScore {
      withAnimation() {
        if self.circleProgress <= CGFloat(creditScore)/CGFloat(totalScore) {
          self.circleProgress += 0.1
        }
      }
    }
  }
}

// MARK:- Extension to implement the CreditReport Delegate methods

extension CSDonutView: CreditReportDelegate
{
  func didReciveResponse(response: CSReport)
  {
    self.isLoading = false
    self.score = "\(response.creditReportInfo.score)"
    self.maxScoreValue = "\(response.creditReportInfo.maxScoreValue)"
    self.startLoading(creditScore: response.creditReportInfo.score, totalScore: response.creditReportInfo.maxScoreValue)
    print("Credit score-\(response.creditReportInfo.score) out of \(response.creditReportInfo.maxScoreValue) ")
  }
  
  func didReciveError(error: String)
  {
    self.isLoading.toggle()
    self.isAlert.toggle()
    self.isError = (true, error)
  }
}
