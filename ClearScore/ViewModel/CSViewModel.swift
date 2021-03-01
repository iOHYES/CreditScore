//
//  CSViewModel.swift
//  ClearScore
//
//  Created by Ujjwal on 28/02/2021.
//

import Foundation

/// Protocol to notify Success or Failure of the API call
protocol CreditReportDelegate {
  func didReciveResponse(response: CSReport)
  func didReciveError(error: String)
}

/// ViewModel for handling the data required for credit score view
struct CSViewModel
{
  var delegate:CreditReportDelegate?
  
  /// Function to make API call to get the credit score report data
  func getCreditReport()
  {
    let network = NetworkManager()
    network.getData(method: .GET, endpoint: .mockCreditValues, dictionary: nil, type: CSReport.self) { (result) in
      switch result {
      case .Success(let result):
        delegate?.didReciveResponse(response: result)
      case .Error(let error):
        delegate?.didReciveError(error: error)
      }
    }
  }
}
