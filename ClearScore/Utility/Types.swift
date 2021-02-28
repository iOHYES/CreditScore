//
//  Types.swift
//  ClearScore
//
//  Created by Ujjwal on 28/02/2021.
//

import Foundation

enum MethodType {
  case POST
  case GET
}

/// Enum for Success and Error scenarios
enum Result<T> {
  case Success(T)
  case Error(String)
}
