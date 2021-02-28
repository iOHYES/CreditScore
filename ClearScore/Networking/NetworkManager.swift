//
//  NetworkManager.swift
//  ClearScore
//
//  Created by Ujjwal on 28/02/2021.
//

import Foundation
import CoreData

/// Class responsible for handling the network calls to Planet API
class NetworkManager
{
  static let shared = NetworkManager()
  
  /// Function to fetch list of planets from the given url
  /// - Parameter completion:Clouser with Enum with Tuples for Success and Failure condition
  func getData<T: Codable>(method: MethodType,
                           endpoint: CreditScoreAPI,
                           dictionary:[String:String]?,
                           type: T.Type,
                           completion: @escaping (Result<T>) -> Void) {
    
    /// Get the urlString from constants
    guard let urlString = endpoint.path.isEmpty ? "\(endpoint.baseURL)" : endpoint.baseURL.appendingPathComponent(endpoint.path).absoluteString.removingPercentEncoding else {
      return completion(.Error(Constants().kInvalidURLError))
    }
    
    /// Create the url from urlString
    guard let url = URL(string: urlString) else {
      return completion(.Error(Constants().kInvalidURLError))
    }
    
    ///Create url request
    var request = URLRequest(url: url)
    
    if method == .POST
    {
      request.httpMethod = "\(method)"
      request.setValue("application/json", forHTTPHeaderField: "Content-Type")
      if let postBody = dictionary {
        guard let httpBody = try? JSONSerialization.data(withJSONObject: postBody, options: []) else {
          completion(.Error(Constants().kInvalidPostData))
          return
        }
        request.httpBody = httpBody
      }
    }
    
    /// Call the DataTask clouser from URLSession shared instance
    URLSession.shared.dataTask(with: request) { (data, response, error) in
      
      /// guard for the error situation
      guard error == nil else {
        return completion(.Error(error!.localizedDescription))
      }
      
      guard let data = data else {
        return completion(.Error(error?.localizedDescription ?? Constants().KEmptyData))
      }
      
      let response = Response()
     
      do {
        let decoded = try response.decode(type.self, data: data)
        completion(.Success(decoded!))
      } catch let error{
        completion(.Error(error.localizedDescription))
      }
      
    }.resume()
  }
}
