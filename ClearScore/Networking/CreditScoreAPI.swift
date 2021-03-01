//
//  CreditScoreAPI.swift
//  ClearScore
//
//  Created by Ujjwal on 28/02/2021.
//

import Foundation

/// Use this enum to create base url and endpoint path
/// Add additional cases for future API services
enum CreditScoreAPI {
  case mockCreditValues
}

/// Create base url and path components based on the enum case.
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
