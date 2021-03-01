//
//  Types.swift
//  ClearScore
//
//  Created by Ujjwal on 28/02/2021.
//

import Foundation

// MARK: Http Method Type
enum MethodType {
  case POST
  case GET
}

// MARK: Success and Error scenarios Type
enum Result<T> {
  case Success(T)
  case Error(String)
}
