//
//  Response.swift
//  ClearScore
//
//  Created by Ujjwal on 28/02/2021.
//

import Foundation

struct Response {
}

extension Response {
  public func decode<T: Codable>(_ type: T.Type, data: Data) throws -> T?
  {
        let jsonDecoder = JSONDecoder()
        do {
            let response = try jsonDecoder.decode(T.self, from: data)
            return response
        } catch let error {
          throw error
        }
    }
}
