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
    
    @ObservedObject var viewModel: CSReortViewModel
    
    init(vm: CSReortViewModel = CSReortViewModel()) {
        viewModel = vm
    }
    
  var body: some View {
    ZStack
    {
      ///Check if the API response is received and there is no error
      ///if true, display the credit score details view
      ///if false, display the retry button
        if !viewModel.isLoading && !viewModel.isError.0 {
            CSDetailsView(score: $viewModel.score, maxScoreValue: $viewModel.maxScoreValue)
            CSDonutProgressView(progress: $viewModel.circleProgress)
      }
      else {
        showLoadingOrRetryButton()
      }
      
      Circle()
        .stroke(colorScheme == .dark ? Color.white : Color.black, lineWidth: 2)
        .padding(.horizontal,28)
      
    }
    .alert(isPresented: $viewModel.isAlert) {
      Alert(
        title: Text("Error"),
        message: Text(viewModel.isError.1)
      )
    }
  }
}

// MARK:- Extension to handle loading UI and Retry button UI

extension CSDonutView
{
  fileprivate func showLoadingOrRetryButton() -> VStack<_ConditionalContent<Button<Text>, Text>> {
    return VStack {
        if self.viewModel.isError.0
      {
        Button(action: {
            self.viewModel.isLoading.toggle()
            self.viewModel.isError = (false,"")
            self.viewModel.getScoreData()
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

// MARK:- Extension to implement the CreditReport Delegate methods
