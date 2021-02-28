//
//  CreditScoreAPI.swift
//  ClearScore
//
//  Created by Ujjwal on 28/02/2021.
//

import Foundation

enum CreditScoreAPI {
  case mockCreditValues
}

extension CreditScoreAPI: EndpointType
{
  var baseURL: URL {
    switch self {
    case .mockCreditValues :
      return URL(string: "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/")!
    }
  }
  
  var path: String {
    switch self {
    case .mockCreditValues :
      return "prod/mockcredit/values"
    }
  }
  
}
