//
//  CreditScoreViewModel.swift
//  ClearScore
//
//  Created by Ujjwal on 28/02/2021.
//

import Foundation

protocol CreditReportDelegate {
  func didReciveResponse(response: CreditReport)
  func didReciveError(error: String)
}

struct CreditScoreViewModel {
  
  var delegate:CreditReportDelegate?
  
  func getCreditReport()
  {
    let network = NetworkManager()
    network.getData(method: .GET, endpoint: .mockCreditValues, dictionary: nil, type: CreditReport.self) { (result) in
      switch result {
      case .Success(let result):
        delegate?.didReciveResponse(response: result)
      case .Error(let error):
        delegate?.didReciveError(error: error)
      }
    }
  }
}
